#!/bin/bash
yum update -y --exclude=kernel
yum install -y nano git unzip screen
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html
service httpd start
yum install -y php php-cli php-common php-devel php-mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
mysql -u root -e "SHOW DATABASES";

cd /vagrant
sudo -u root wget -q  https://github.com//inder991/Learning/blob/master/files/index.html
sudo -u root wget -q  https://github.com/inder1991/Learning/blob/master/files/info.php
service httpd restart
