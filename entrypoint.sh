#!/bin/bash

FILE=/opt/scripts/listener_http.rc
if [[ -f "$FILE" ]]; then
    sed -i "s,Host https://127.0.0.1,Host https://$EMPIRE_LHOST," $FILE
    sed -i "s,Port 443,Port $EMPIRE_LPORT," $FILE
fi

FILE=/empire/empire/server/config.yaml
if [[ -f "$FILE" ]]; then
    sed -i "s,username: empireadmin,username: $EMPIRE_USER," $FILE
    sed -i "s,password: password123,password: $EMPIRE_PASS," $FILE
fi

FILE=/empire/empire/client/config.yaml
if [[ -f "$FILE" ]]; then
    sed -i "s,host: https://localhost,host: https://$EMPIRE_LHOST," $FILE
    sed -i "s,port: 1337,port: $EMPIRE_REST_PORT," $FILE
    sed -i "s,socketport: 5000,socketport: $EMPIRE_SOCKET_PORT," $FILE
    sed -i "s,username: empireadmin,username: $EMPIRE_USER," $FILE
    sed -i "s,password: password123,password: $EMPIRE_PASS," $FILE
fi

exec $@

