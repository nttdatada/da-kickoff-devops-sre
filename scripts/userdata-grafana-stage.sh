#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install awscli aptitude git ansible python-pip -y

sudo mkdir /data
sudo echo "UUID=fd8202c6-f3fc-48ed-b71f-72647017a029  /data  xfs  defaults,nofail  0  2" >> /etc/fstab

# sudo ansible-pull -U git@git..... --accept-host-key ./ansible/grafana.yml

sudo reboot