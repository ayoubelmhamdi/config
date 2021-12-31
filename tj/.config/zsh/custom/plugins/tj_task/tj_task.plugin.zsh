## This is my task warrior alias, function and usability.

# ~~~~~~~~~~~~~~~~~~~~~~~~~ Aliases # ~~~~~~~~~~~~~~~~~~~~~~~~~
alias think='tickle +1d'
alias rnd='task add +rnd +next +@computer +@online'
alias rnrw=read_and_review
alias in='task add +in'
alias tls='task +next list'
alias hw='task list +homework'

# ~~~~~~~~~~~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~~

### My own functions:

# School function. Useful for quickly adding and viewing current homework

school_add() {
    task add +homework project:$2 $1 due:$3
}


update_task() {
    LATEST=$(curl http://tasktools.org/latest -s)

    CURRENT=$(task --version)

    echo "Latest is $LATEST"
    echo "Current is $CURRENT"

    if [ "$LATEST" = "$CURRENT" ];
    then
        echo "Up to date"
    else
        echo "Not up to date"
        wget http://taskwarrior.org/download/task-$LATEST.tar.gz
        tar xzvf task-$LATEST.tar.gz
        cd task-$LATEST
        cmake -DCMAKE_BUILD_TYPE=release .
        make
        sudo make install
        rm task-$LATEST.tar.gz
    fi
}


# Find annotation file
# Usage ff <filter>
ff () {
    # Print out information about filtered tasks
    task $@ long
    echo ""

    # Prompt a response
    echo "Is this the file you want to edit?"
    # Splits on ':' -> Gives everything after File:
    file="$(task $@ all | grep File: | awk '{split($0,array,":")} END{print array[2]}')"
    echo $file

    # Decide what to do
    read answer

    if [ $answer == 'y' ]
    then
        # Added the echo and '~' replacement just in case
        #	someone wants to use ~/Documents file
        #	etc.
        $EDITOR $(echo ${file/'~'/$HOME})
    fi
}


next () {
    proj="$1"
    shift
    task add +next project:"$proj" $@
}

# only changes inbox things to waiting things
# Like I'm now waiting on someone to do a certain task.
waiting() {
    task_id="$1"
    due="$2"
    wait="$3"
    shift
    task "$task_id" modify -in +waiting
    task "$task_id" annotate $@ due:+"$due" wait:+"$wait"
}

contags () {
    echo "Contags are:"
    CONTAG=""
    line=$(task tagsonly | grep @)
    set -- junk $line
    shift
    for word; do
        if [[ $word == *"@"* ]]
        then
            CONTAG="$CONTAG $word"
        fi
    done
    echo $CONTAG | xargs -n1 | sort -u
}

t_pretty () {
    while read line
    do
        echo "$line" | python3 -m json.tool
    done < <(task $1 export)
}

someday () {
    task add "$@" +no +far due:someday
}

# Adds a week of Devo's.
# Assumes still doing the 1 chapter per week idea
devo_week () {

    task add $@ due:eod recur:daily until:Saturday +devos +next +@computer
}


### Other Functions

### ### Syd's blog from taskwarrior

tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}

# Read and review, web
webpage_title (){
    wget -qO- "$*" | hxselect -s '\n' -c  'title' 2>/dev/null
}

read_and_review (){
    link="$1"
    title=$(webpage_title $link)
    echo $title
    descr="Read and review: $title"
    id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}
