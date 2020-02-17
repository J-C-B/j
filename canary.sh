#!/usr/bin/env bash
#joshhighet
CANARYEXTIP=127.0.0.1
CANARYDOMAIN=josh.joshhighet.com
sudo apt-get install -y \
python-pip \
python-dev \
libyaml-dev \
docker-compose
git clone https://github.com/thinkst/canarytokens-docker
cd canarytokens-docker
mv switchboard.env.dist switchboard.env
mv frontend.env.dist frontend.env
sed -i 's/CANARY_PUBLIC_IP=/CANARY_PUBLIC_IP='$CANARYEXTIP'/g' switchboard.env
sed -i 's/#CANARY_PUBLIC_DOMAIN=/CANARY_PUBLIC_DOMAIN='$CANARYDOMAIN'/g' switchboard.env
sed -i 's/CANARY_ALERT_EMAIL_FROM_ADDRESS=/#CANARY_ALERT_EMAIL_FROM_ADDRESS=/g' switchboard.env
sed -i 's/CANARY_ALERT_EMAIL_FROM_DISPLAY=/#CANARY_ALERT_EMAIL_FROM_DISPLAY=/g' switchboard.env
sed -i 's/CANARY_ALERT_EMAIL_SUBJECT=/#CANARY_ALERT_EMAIL_SUBJECT=/g' switchboard.env
sed -i 's/CANARY_DOMAINS=localhost/CANARY_DOMAINS='$CANARYDOMAIN'/g' frontend.env
sed -i 's/CANARY_NXDOMAINS=yourdomain.com/#CANARY_NXDOMAINS=nullptr.joshhighet.com/g' frontend.env
sed -i 's/ubuntu:16.04/ubuntu:18.04/g' canarytokens/Dockerfile
#not utilising DNS canaries - shift ports so mainstream resolution is not tampered with
sed -i 's/53:53/5300:5300/g' docker-compose.yml
#hugepages
sudo bash -c "echo never > /sys/kernel/mm/transparent_hugepage/enabled"
sed -r 's/GRUB_CMDLINE_LINUX_DEFAULT="[a-zA-Z0-9_= ]*/& transparent_hugepage=never/' /etc/default/grub \
| sudo tee /etc/default/grub
#overcommit_mem
sudo echo "vm.overcommit_memory = 1" | tee /etc/sysctl.conf
sudo sysctl vm.overcommit_memory=1
sudo update-grub
sudo docker-compose up
