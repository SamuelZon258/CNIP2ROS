#!/bin/bash
curl -s https://ispip.clang.cn/all_cn.txt |\
sed -e "s/^/add address=/g"|\
sed -e "s/$/ list=CNIP/g"|\
sed -e '1i\\nadd address=10.0.0.0/8 list=CNIP comment=private-network'|\
sed -e '1i\\nadd address=172.16.0.0/12 list=CNIP comment=private-network'|\
sed -e '1i\\nadd address=192.168.0.0/16 list=CNIP comment=private-network'|\
sed -e '1i\\nremove [/ip firewall address-list find list=CNIP]'|\
sed -e '1i\\n/ip firewall address-list'>cnip.rsc
