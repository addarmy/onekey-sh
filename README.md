
一键后端<br>
wget -N --no-check-certificate https://raw.githubusercontent.com/addarmy/onekey-sh/master/node.sh && chmod +x node.sh && ./node.sh<br>
编辑<br>
vi /root/shadowsocks/userapiconfig.py<br>

修改VPS时区(中国上海)<br>
yum -y install ntpdate ntp<br>
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime<br>
ntpdate time.windows.com<br>

计划任务重启VPS<br>
安装Crontab(如果需要)<br>
yum install vixie-cron crontabs<br>
设置开机启动Crontab<br>
chkconfig crond on<br>
启动Crontab<br>
service crond start<br>
设置每天凌晨五点自动重启
crontab -e<br>
0 5 * * * /sbin/reboot<br>

更改SSH端口<br>
vi /etc/ssh/sshd_config
service sshd restart

