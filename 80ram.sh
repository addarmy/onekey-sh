#!/bin/bash
 
mem_total=`free -m | awk 'NR==2' | awk '{print $2}'` 
 
mem_free=`free -m | awk 'NR==3' | awk '{print $4}'`
 
mem_used=`free -m | grep Mem | awk '{print  $3}'` 
 
if (($mem_used != 0)); then 
 
mem_per=0`echo "scale=2;$mem_free/$mem_total" | bc` 
DATA="$(date -d "today" +"%Y-%m-%d-%H-%M") free percent is : $mem_per"
echo $DATA >> /var/log/mem_detect.log
 
mem_warn=0.20 
  
mem_now=`expr $mem_per \> $mem_warn` 
 
if (($mem_now == 0)); then 
sync
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches

echo "--->release memory OK ! " >>temp/memstat_$(date +%Y%m%d_%H%M%S).log
 
fi
fi
