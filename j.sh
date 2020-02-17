####################
#joshhhighet basevm#
####################
#todo : dnsconf-doh , nebula/argo gitconf/pull, motd/banner, checksum verify, userconfig, tzdata gmt+12
#################################################################################
#1linar
#git clone https://github.com/joshhighet/j.git && cd j && chmod +x j.sh && ./j.sh
#################################################################################
if ! [ "$(id -u)" = 0 ]; then
  printf "j.sh needs root!"
  exit 0
fi
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE !$H+H*' | tee /etc/motd
adduser josh
usermod -aG sudo josh
su - josh
mkdir /home/josh/.ssh
touch /home/josh/.ssh/authorized_keys
######################################
#########WAF-BYPASS-CONDITION#########
#(http.user_agent contains "curl/"####
#and http.request.method eq "GET"#####
#and http.host eq "joshhighet.com"####
#and http.request.uri.path eq "/ssh")#
######################################
curl -s -L joshhighet.com/ssh \
| tee ~/.ssh/authorized_keys
ssh-keygen -t rsa -b 4096 -C "autodep@joshhighet.com"
touch ~/.hushlogin
curl -C -s - https://pkg.cloudflare.com/pubkey.gpg \
| sudo apt-key add -
echo 'deb http://pkg.cloudflare.com/ xenial main' \
| sudo tee /etc/apt/sources.list.d/cloudflare-main.list
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
clear
printf "$HOST pubkey:\n"
cat ~/.ssh/id_rsa.pub
printf "external ipaddr info\n"
curl -s ipinfo.io | jq
