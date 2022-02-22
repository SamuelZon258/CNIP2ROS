#!/bin/bash
curl -s http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest |\
awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }'|\
sed -e "s/^/add address=/g"|\
sed -e "s/$/ list=CNIP/g"|\
sed -e '1i\\nadd address=10.0.0.0/8 list=CNIP comment=private-network'|\
sed -e '1i\\nadd address=172.16.0.0/12 list=CNIP comment=private-network'|\
sed -e '1i\\nadd address=192.168.0.0/16 list=CNIP comment=private-network'|\
sed -e '1i\\nremove [/ip firewall address-list find list=CNIP]'|\
sed -e '1i\\n/ip firewall address-list'>cnipmax.rsc
