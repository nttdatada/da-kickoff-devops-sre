#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install awscli aptitude git ansible python3-pip -y

sudo mkdir /data
sudo echo "UUID=fd8202c6-f3fc-48ed-b71f-72647017a029  /data  xfs  defaults,nofail  0  2" >> /etc/fstab

ansible-pull -U https://nttdatada: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@github.com/nttdatada/da-kickoff-devops-sre.git ansible/grafana.yml


sudo reboot