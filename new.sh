#!/bin/bash
#关闭CentOS7的防火墙
systemctl stop firewalld.service
systemctl disable firewalld.service
#iptables
yum install -y iptables
iptables -F
iptables -X  
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p udp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p udp --dport 443 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 19920:19922 -j ACCEPT
iptables -I INPUT -p udp -m udp --dport 19920:19922 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 9000:9999 -j ACCEPT
iptables -I INPUT -p udp -m udp --dport 9000:9999 -j ACCEPT
iptables-save >/etc/sysconfig/iptables
systemctl start iptables.service
systemctl enable iptables.service
#yum install
yum -y install ntpdate ntp
#同步时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate time.windows.com
#安装加速
wget "https://github.com/chiakge/Linux-NetSpeed/raw/master/tcp.sh"
chmod +x tcp.sh
#DDNS
wget "https://raw.githubusercontent.com/addarmy/onekey-sh/master/cf-v4-ddns.sh"
chmod +x cf-v4-ddns.sh
vi cf-v4-ddns.sh
./cf-v4-ddns.sh
vi /etc/ssh/sshd_config
service sshd restart
./tcp.sh
