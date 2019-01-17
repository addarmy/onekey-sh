
一键后端<br>
wget -N --no-check-certificate https://raw.githubusercontent.com/addarmy/onekey-sh/master/node.sh && chmod +x node.sh && ./node.sh<br>
编辑<br>
vi /root/shadowsocks/userapiconfig.py<br>

修改VPS时区(中国上海)<br>
yum -y install ntpdate ntp<br>
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime<br>
ntpdate time.windows.com<br>

