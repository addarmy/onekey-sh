#!/bin/bash
 
#系统分配的区总量 
mem_total=`free -m | awk 'NR==2' | awk '{print $2}'` 
 
#当前剩余的大小 
mem_free=`free -m | awk 'NR==3' | awk '{print $4}'`
 
#当前已使用的used大小 
mem_used=`free -m | grep Mem | awk '{print  $3}'` 
 
if (($mem_used != 0)); then 
 
#如果已被使用，则计算当前剩余free所占总量的百分比，用小数来表示，要在小数点前面补一个整数位0 
mem_per=0`echo "scale=2;$mem_free/$mem_total" | bc` 
DATA="$(date -d "today" +"%Y-%m-%d-%H-%M") free percent is : $mem_per"
echo $DATA >> /var/log/mem_detect.log
#设置的告警值为20%(即使用超过80%的时候告警)。 
mem_warn=0.20 
 
#当前剩余百分比与告警值进行比较（当大于告警值(即剩余20%以上)时会返回1，小于(即剩余不足20%)时会返回0 ） 
mem_now=`expr $mem_per \> $mem_warn` 
 
#如果当前使用超过80%（即剩余小于20%，上面的返回值等于0），释放内存
if (($mem_now == 0)); then 
sync
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
#将release memory OK !写入temp文件夹的memstat_日期.log日志中
echo "--->release memory OK ! " >>temp/memstat_$(date +%Y%m%d_%H%M%S).log
 
fi
fi
