#!/bin/bash
if [[ $1 = apt://* ]]; then
echo "${1#apt://}" | xargs qapt-batch --install
elif [[ $1 = apt:/* ]]; then
echo "${1#apt:/}" | xargs qapt-batch --install
elif [[ $1 = apt:* ]]; then
echo "${1#apt:}" | xargs qapt-batch --install
fi
