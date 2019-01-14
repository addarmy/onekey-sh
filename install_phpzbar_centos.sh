#!/bin/bash

#centos
yum install ImageMagick ImageMagick-devel -y
yum groupinstall Development tools -y
#debian
#apt-get install imagemagick git -y
cd /root
wget http://jaist.dl.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2 && tar jxvf zbar-0.10.tar.bz2 && cd zbar-0.10
./configure --disable-video --without-gtk --without-python --without-qt --prefix=/usr/local/zbar
make && make install
ldconfig
ln -s /usr/local/zbar/lib/pkgconfig/zbar.pc /usr/lib64/pkgconfig/zbar.pc
cd /root
rm -rf zbar-0.10
git clone -b gophp7 https://github.com/jorissteyn/php-zbarcode.git && cd php-zbarcode
phpize
./configure --with-php-config=/www/server/php/71/bin/php-config
make && make install
cd /root
rm -rf php-zbarcode