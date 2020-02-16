#joshhhighet basevm
curl -s -L joshhighet.com/ssh \
| tee ~/.ssh/authorized_keys
ssh-keygen -t rsa -b 4096
touch ~/.hushlogin
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y
sudo apt-get install -y \
zsh \
git \
python3 \
python3-pip \
python3-virtualenv \
tree \
fail2ban \
ufw \
jq \
nmap \
tcpdump \
multitail \
sysstat \
jq \
moreutils \
unattended-upgrades
echo ~/.ssh/id_rsa.pub
