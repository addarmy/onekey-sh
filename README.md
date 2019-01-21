
<h3>一键后端</h3>
wget -N --no-check-certificate https://raw.githubusercontent.com/addarmy/onekey-sh/master/node.sh && chmod +x node.sh && ./node.sh<br>
wget "https://github.com/addarmy/onekey-sh/raw/master/node.sh" && chmod +x node.sh && ./node.sh<br>
<h3>编辑</h3>
vi /root/shadowsocks/userapiconfig.py<br>

<h2>防火墙+同步时区+DDNS+加速+ssh端口</h2>
yum -y install wget && wget -N --no-check-certificate https://raw.githubusercontent.com/addarmy/onekey-sh/master/new.sh && chmod +x new.sh && ./new.sh<br>
<h2>计划任务</h2>
*/10 * * * * root /root/cf–v4-ddns.sh
*/30 * * * * root /root/clean-ram.sh

<h3>计划任务重启VPS</h3>
安装Crontab(如果需要)<br>
yum install vixie-cron crontabs<br>
设置开机启动Crontab<br>
chkconfig crond on<br>
启动Crontab<br>
service crond start<br>
设置每天凌晨五点自动重启<br>
crontab -e<br>
0 5 * * * /sbin/reboot<br>

<h3>更改SSH端口</h3>
vi /etc/ssh/sshd_config
service sshd restart

<h3>BBR/锐速加速</h3>
wget "https://github.com/chiakge/Linux-NetSpeed/raw/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh<br>

<h3>DDNS PY</h3>
curl https://raw.githubusercontent.com/addarmy/cloudflare_ddns/master/cf-ddns.py > /usr/local/bin/cf-ddns.py && curl https://raw.githubusercontent.com/addarmy/cloudflare_ddns/master/cf-ddns.conf > /usr/local/bin/cf-ddns.conf && chmod +x /usr/local/bin/cf-ddns.py

vi /usr/local/bin/cf-ddns.conf

python /usr/local/bin/cf-ddns.py

crontab -e

*/10 * * * * /usr/local/bin/cf-ddns.py >/dev/null 2>&1<br>

<h3>DDNS SH</h3>
yum -y install wget && wget "https://raw.githubusercontent.com/addarmy/onekey-sh/master/cf-v4-ddns.sh" && chmod +x cf-v4-ddns.sh && vi cf-v4-ddns.sh
<br>

./cf-v4-ddns.sh

crontab -e

*/10 * * * * /root/cf–v4-ddns.sh >/dev/null 2>&1
