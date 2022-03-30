#!/usr/bin/env xonsh

source ~/.config/xonsh/alias.xsh


#$PROMPT = '{env_name}{BOLD_GREEN}{user}{RESET}@{hostname}:{BOLD_GREEN}{cwd}{RESET}|{gitstatus}......................................................................................\n{BOLD_INTENSE_RED}➤➤ {RESET} '
$PROMPT = '{env_name}{BOLD_GREEN}{user}{RESET}@{hostname}:{BOLD_GREEN}{cwd} {RESET}{gitstatus}\n{BOLD_RED}➤ {BOLD_BLUE}➤ {RESET} '

$XONSH_HISTORY_BACKEND = 'sqlite'
$HISTCONTROL='ignoredups'


# modules
xontrib load argcomplete
xontrib load fzf-widgets
xontrib load output_search
xontrib load sh

# config for fzf
$fzf_history_binding = "c-r"  # Ctrl+R
$fzf_ssh_binding = "c-s"      # Ctrl+S
$fzf_file_binding = "c-f"      # Ctrl+T
$fzf_dir_binding = "c-g"      # Ctrl+G

$fzf_find_command = "fd"
$fzf_find_dirs_command = "fd -t d"

# ..


from xonsh.platform import ON_LINUX  # remove if not necessary
# Globbing files with “*” or “**” will also match dotfiles, or those ‘hidden’ files whose names begin with a literal ‘.’. 
# Note! This affects also on rsync and other tools.
$DOTGLOB = True

$MANPAGER = "less -X"
$LESS = "--ignore-case --quit-if-one-screen --quit-on-intr FRXQ"
