#!/bin/bash
yum -y install ntpdate ntp
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate time.windows.com
