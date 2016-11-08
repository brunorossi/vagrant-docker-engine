#!/bin/bash

echo -e "Install DOCKER SERVER"

sudo -s

\cp /vagrant/provisioners/bash/docker/etc/yum.repos.d/docker.repo /etc/yum.repos.d/docker.repo

yum -y update

yum -y install docker-engine

systemctl unmask docker.service

systemctl enable docker.service

systemctl start docker.service

useradd -G docker -p `openssl passwd -crypt passwd` developer
