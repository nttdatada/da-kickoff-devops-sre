#!/bin/bash

sudo apt update
sudo apt install awscli aptitude git ansible python-pip -y

# sudo ansible-pull -U git@git..... --accept-host-key ./ansible/grafana.yml