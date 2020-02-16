####################
#joshhhighet basevm#
####################
#todo : dnsconf-doh , nebula/argo gitconf/pull, motd/banner, checksum verify, userconfig
#################################################################################
#oneliner
#git clone https://github.com/joshhighet/-.git && cd - && chmod +x -.sh && ./-.sh
#################################################################################
curl -s -L joshhighet.com/ssh \
| tee ~/.ssh/authorized_keys
ssh-keygen -t rsa -b 4096
touch ~/.hushlogin
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y \
jq \
ufw \
zsh \
git \
nmap \
tree \
lolcat \
sysstat \
tcpdump \
python3 \
torsocks \
fail2ban \
multitail \
moreutils \
python3-pip \
python3-virtualenv \
unattended-upgrades
sudo apt autoclean -y
sudo apt autoremove -y
printf "$HOST pubkey:\n"
cat ~/.ssh/id_rsa.pub
printf "external ipaddr info\n"
curl -s ipinfo.io | jq
