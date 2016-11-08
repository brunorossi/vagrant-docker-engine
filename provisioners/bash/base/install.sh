#!/bin/bash
echo -e "Set BASIC PACKAGES"
sudo -s
yum -y upgrade
yum -y update
yum -y install epel-release
yum -y install wget nano git unzip ntp ntpdate ntp-doc net-tools httpd-tools dos2unix

echo -e "Set NTPD \n"
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime
rm -f /etc/ntp.conf
\cp /vagrant/provisioners/bash/base/etc/ntp.conf /etc/ntp.conf
chkconfig ntpd on
service ntpd start

echo -e "Set HOSTNAME \n"
hostnamectl set-hostname docker-dev
hostnamectl set-hostname "Docker Development Personal Server" --pretty
hostnamectl set-hostname docker-dev.condenast.local.it --static

echo -e "Set KEYMAP LANGUAGE \n"
localectl set-keymap it

echo -e "Set SELINUX \n "
setenforce Permissive
\cp /vagrant/provisioners/bash/base/etc/selinux/config /etc/selinux/config