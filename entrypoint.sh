#!/bin/bash

FILE=/opt/scripts/listener_http.rc
if [[ -f "$FILE" ]]; then
    sed -i "s,Host https://127.0.0.1,Host https://$EMPIRE_LHOST," $FILE
    sed -i "s,Port 443,Port $EMPIRE_LPORT," $FILE
fi

FILE=empire/server/config.yaml
if [[ -f "$FILE" ]]; then
    sed -i "s,username: empireadmin,username: $EMPIRE_USER," $FILE
    sed -i "s,password: password123,password: $EMPIRE_PASS," $FILE
    sed -i "s,location: empire.db,location: $EMPIRE_DATA_PATH/empire.db," $FILE
    sed -i "s,use: mysql,use: $EMPIRE_DB," $FILE
    sed -i "s,url: localhost:3306,url: $EMPIRE_MYSQL_HOST," $FILE
    sed -i "s,username: empire_user,username: $EMPIRE_MYSQL_USERNAME," $FILE
    sed -i "s,password: empire_password,password: $EMPIRE_MYSQL_PASSWORD," $FILE
    sed -i "s,database_name: empire,database_name: $EMPIRE_MYSQL_DB," $FILE
    sed -i "s,downloads: downloads,downloads: $EMPIRE_DATA_PATH/downloads," $FILE
fi

mkdir -p $EMPIRE_DATA_PATH

exec $@

