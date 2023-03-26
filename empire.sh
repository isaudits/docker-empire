#!/bin/bash

# If command arguments are passed, run empire with those arguments;
# otherwise, auto-run listener start resource script
if [ "$#" -ne 0 ]; then
    COMMAND="sudo -E poetry run python empire.py $@"
    
else
    COMMAND="sudo -E poetry run python empire.py server"
fi

if [[ $(uname -s) == Linux ]]
then
    HOST_IP=$(ifconfig eth0 | awk '/ *inet /{print $2}')
    
    docker run -it --rm \
    --net=host \
    -e EMPIRE_LHOST=$HOST_IP \
    isaudits/empire $COMMAND
else
    HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}')
    
    docker run -it --rm \
    -p 443:443 -p 1337:1337 \
    -e EMPIRE_LHOST=$HOST_IP \
    isaudits/empire $COMMAND
fi

