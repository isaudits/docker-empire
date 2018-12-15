#!/bin/bash

sed -i "s,https://127.0.0.1:443,https://$EMPIRE_LHOST:$EMPIRE_LPORT," scripts/listener_https.rc
sed -i "s,https://127.0.0.1:8443,https://$MSF_LHOST:$MSF_LPORT," scripts/listener_meterpreter.rc


cd /opt/Empire
#exec ./empire $@
exec $@

