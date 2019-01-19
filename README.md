
<h3>一键后端</h3>
wget -N --no-check-certificate https://raw.githubusercontent.com/addarmy/onekey-sh/master/node.sh && chmod +x node.sh && ./node.sh<br>
wget "https://github.com/addarmy/onekey-sh/raw/master/node.sh" && chmod +x node.sh && ./node.sh<br>
编辑<br>
vi /root/shadowsocks/userapiconfig.py<br>

修改VPS时区(中国上海)<br>
查看vps时间:date<br>
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
设置每天凌晨五点自动重启<br>
crontab -e<br>
0 5 * * * /sbin/reboot<br>

更改SSH端口<br>
vi /etc/ssh/sshd_config
service sshd restart

BBR/锐速加速<br>
wget "https://github.com/chiakge/Linux-NetSpeed/raw/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh<br>

DDNS PY<br>
curl https://raw.githubusercontent.com/addarmy/cloudflare_ddns/master/cf-ddns.py > /usr/local/bin/cf-ddns.py && curl https://raw.githubusercontent.com/addarmy/cloudflare_ddns/master/cf-ddns.conf > /usr/local/bin/cf-ddns.conf && chmod +x /usr/local/bin/cf-ddns.py

vi /usr/local/bin/cf-ddns.conf

python /usr/local/bin/cf-ddns.py

crontab -e

*/10 * * * * /usr/local/bin/cf-ddns.py >/dev/null 2>&1<br>

<h2>DDNS SH</h2>
wget "https://raw.githubusercontent.com/addarmy/onekey-sh/master/cf-v4-ddns.sh" && chmod +x cf-v4-ddns.sh && ./cf-v4-ddns.sh<br>

vi cf-v4-ddns.sh

crontab -e

*/10 * * * * /root/cf–v4-ddns.sh >/dev/null 2>&1
