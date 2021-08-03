#!/bin/bash

sed -i "s,https://127.0.0.1:443,https://$EMPIRE_LHOST:$EMPIRE_LPORT," /opt/scripts/listener_https.rc
sed -i "s,https://127.0.0.1:8443,https://$MSF_LHOST:$MSF_LPORT," /opt/scripts/listener_meterpreter.rc

sed -i "s,username: empireadmin,username: $EMPIRE_USER," /usr/share/powershell-empire/empire/server/config.yaml
sed -i "s,password: password123,password: $EMPIRE_PASS," /usr/share/powershell-empire/empire/server/config.yaml

exec $@

