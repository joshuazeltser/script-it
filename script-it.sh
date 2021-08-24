#!/bin/bash

COMMANDS=$1
FILE_NAME=$2
echo ${COMMANDS}

HISTFILE=~/.bash_history
set -o history

if [ "$1" = "--help" ]; then
    echo "script-it help"  
    exit 1
elif [ $# -lt 2 ]; then
    echo "Invalid number of arguments. Run ./script-it --help for more info"
    exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
    echo "The number of commands you added is invalid. Please run ./script-it --help for more info"
    exit 1
fi

history | tail -n ${COMMANDS} | cut -c 8- > ${FILE_NAME}
chmod +x ${FILE_NAME}
