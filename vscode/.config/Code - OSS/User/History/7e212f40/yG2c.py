#!/usr/bin/env python3

import time
import json
from contextlib import contextmanager
import os
import sys

from filelock import FileLock

LOCKED: bool = True
UNLOKED: bool = False

OFF: bool    = False
ON : bool    = True

# duplicate
# 10 const:
JSON_FILE_NAME='servers.json'
NAME_KEY: str = "name"
REQUESTS_STARTED_KEY: str = 'requests_started'
REQUESTS_FINISHED_KEY: str = 'requests_finished'
STATUS_ONLINE_KEY: str = 'status_online'
STATUS_G4F_KEY: str = "g4f_online"
RPM_KEY: str = 'RPM'
WINDOW_CONTEXT_KEY: str = "window_context"
TEXT_MODELS_KEY: str = "text_models"
IPS_KEY: str = 'ips'



# TODO: move to generate_models_score.py file
# TODO: check if available file of rank, and if not available,
# i should be easy to recreate, or protect by git.
# with open('final_ranks.json', 'r') as f:
#     models_scores = list(json.load(f))

with open('rank_as_pair.json', 'r') as f:
    rank_as_pair = json.load(f)

with open('all_providers.json', 'r') as f:
    all_providers = json.load(f)


# duplicate
lock = FileLock('lock.lock')

# duplicate
@contextmanager
def flock_open(filename, mode='r'):
    with lock:
        if not os.path.isfile(filename):
            with open(filename, 'w') as file:
                file.write('{}')
        with open(filename, mode) as file:
            yield file



def its_locked(server_info, ip:str="default"):
    now = time.time()
    reqs = []

    if IPS_KEY in server_info:
        # if ip_key not exsit in JSON_FILE_NAME, we use fresh ip and is unlocked by default.
        if ip not in server_info[IPS_KEY]:
            return UNLOKED
        for req in server_info[IPS_KEY][ip].get(REQUESTS_STARTED_KEY, []):
            if now - req < 60:
                reqs.append(req)
        if len(reqs) > server_info.get(RPM_KEY, 100):
            return LOCKED

    else:
        print(f'IPS_KEY does not exist in {server_info} {JSON_FILE_NAME}, check if it is initialised using update_server.py')

    return UNLOKED


# TODO: return pnames only
# NOTE: remove using providers.keys()
def online_servers(json_providers:dict, ip:str="default"):
    """
    intersection between dict json_providers and a list all_providers to get the online servers for this
    search for the banded pnames: offline/not in g4f, and locked in.
    """
    # TODO: support $ip and non g4f

    for pname, d in json_providers.items():
        if d.get(STATUS_ONLINE_KEY, ON) == OFF and pname in all_providers:
            all_providers.remove(pname)
        if d.get(STATUS_G4F_KEY, ON) == OFF and pname in all_providers:
            all_providers.remove(pname)
        if its_locked(d) and pname in all_providers:
            all_providers.remove(pname)

    return all_providers



def select_dummy_server(providers):
    return next(iter(providers))


def best_llm(pnames: list) -> str:
    for model, g4f_pnames in rank_as_pair.items():
        for pname in pnames:
            if pname in g4f_pnames:
                return model, pname
    return None, None

def update_server(json_providers, pname, ip:str="default"):
    if pname not in json_providers:
        # d = {pname : [IPS_KEY][ip][REQUESTS_STARTED_KEY][IPS_KEY][REQUESTS_STARTED_KEY][time.time()]
        # d[IPS_KEY] = {ip: {REQUESTS_STARTED_KEY: [], REQUESTS_FINISHED_KEY:[]}}
        return {}

    d = json_providers[pname]
    if IPS_KEY not in d:
        # print(f'{IPS_KEY} not exsit')
        d[IPS_KEY] = {ip: {REQUESTS_STARTED_KEY: [], REQUESTS_FINISHED_KEY:[]}}

    elif ip not in d[IPS_KEY]:
        # print(f'{ip} ip not exsit')
        d[IPS_KEY][ip]=  {REQUESTS_STARTED_KEY: [time.time()], REQUESTS_FINISHED_KEY:[]}

    elif REQUESTS_STARTED_KEY not in d[IPS_KEY][ip]:
        d[IPS_KEY][ip][REQUESTS_STARTED_KEY] = [time.time()]
    else:
        d[IPS_KEY][ip][REQUESTS_STARTED_KEY] = d.get(IPS_KEY, {}).get(ip, {}).get(REQUESTS_STARTED_KEY, []) + [time.time()]


    return d


def next_server(ip:str="default"):
    with flock_open(JSON_FILE_NAME, 'r+') as f:
        content = f.read()
        if not content:
            raise Exception('we should initialised the JSON_FILE_NAME')
        json_providers = json.loads(content)
        pnames = online_servers(json_providers)
        if not pnames: # use enums for returns for to be matchable.
            return None
        # pnames = providers_2_pnames(pnames)
        # pname = select_dummy_server(pnames)
        model, pname = best_llm(pnames)

        if not model or not pname:
            return None
        d = update_server(json_providers, pname, ip="default")
        json_providers[pname] = d
        f.seek(0)
        json.dump(json_providers, f)
        f.truncate()

        return pname

if __name__ == '__main__' and ( len(sys.argv) < 2 or sys.argv[1]!='jupyter_env'):
    pname = next_server()
    print(pname)
    # print(getattr(g4f.Provider, pname))

# print(f"is_ipy: {hasattr(__builtins__,'__IPYTHON__')}")
print('__end2__')