#!/bin/sh

echo '*** epel install **************'
# remiの前提
rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum update epel-release --enablerepo=epel

echo '*** remi install **************'
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

echo '*** base-items install **************'
yum install -y gcc gcc-c++ make openssl-devel libffi-devel git svn --enablerepo=remi

echo '*** web-server install **************'
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum install -y nginx --disablerepo=epel
nginx -V
chkconfig nginx on
chkconfig --list | grep nginx

echo '*** iptables off **************'
/etc/rc.d/init.d/iptables stop
chkconfig iptables off
chkconfig ip6tables off

# iptablesを使用する場合は以下のような設定を追加する
# /etc/sysconfig/iptables
#  -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
#
# service iptables restart

echo '*** !!!Complete!!! **************'
