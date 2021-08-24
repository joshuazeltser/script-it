#!/bin/bash

COMMANDS=$1
FILE_NAME=$2
echo ${COMMANDS}

HISTFILE=~/.bash_history
set -o history

history | tail -n ${COMMANDS} | cut -c 8- > ${FILE_NAME}
chmod +x ${FILE_NAME}
