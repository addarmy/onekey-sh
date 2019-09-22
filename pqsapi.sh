#!/bin/bash
ADDR=DDNS位置
TMPSTR=ping ${ADDR} -c 1 | sed '1{s/[^(]*(//;s/).*//;q}' 
port=22
check_ip=nmap $TMPSTR -p $port|grep open|wc -l 
if [ $check_ip -eq 0 ];then 
  curl "API網址">/dev/null 2>&1 & 
  nscd -i hosts
  nscd -i passwd
  nscd -i group
  /etc/init.d/nscd restart
  echo ${content} 
fi
echo ${TMPSTR}
