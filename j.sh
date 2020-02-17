####################
#joshhhighet basevm#
#################################################################################
#mkdir /tmp/j && git clone https://github.com/joshhighet/j.git /tmp/j && cd /tmp/j && chmod +x j.sh && ./j.sh
#################################################################################
if ! [ "$(id -u)" = 0 ]; then
  printf "j.sh needs root!"
  exit 0
fi
#################################################################################
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE !$H+H*' | tee /etc/motd
adduser josh --gecos ""
usermod -aG sudo josh
runuser -l josh -c 'mkdir /home/josh/.ssh'
runuser -l josh -c 'touch /home/josh/.ssh/authorized_keys'
######################################
#########WAF-BYPASS-CONDITION#########
#(http.user_agent contains "curl/"####
#and http.request.method eq "GET"#####
#and http.host eq "joshhighet.com"####
#and http.request.uri.path eq "/ssh")#
######################################
runuser -l josh -c 'curl -s -L joshhighet.com/ssh | tee /home/josh/.ssh/authorized_keys'
runuser -l josh -c 'ssh-keygen -t rsa -b 4096 -C "autodep@joshhighet.com"'
curl  -s -C - https://pkg.cloudflare.com/pubkey.gpg | sudo apt-key add -
echo 'deb http://pkg.cloudflare.com/ xenial main' | sudo tee /etc/apt/sources.list.d/cloudflare-main.list
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install -y \
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
cat /tmp/j/alias.zshrc >> /home/josh/.bashrc
chown -R josh:josh /home/josh
source /home/josh/.bashrc
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo hostnamectl set-hostname `date +%s | /shasum -a 512 | base64 | head -c 8`
runuser -l josh -c 'echo "curl -s ipinfo.io | jq" >> /home/josh/.bashrc'
runuser -l josh -c 'touch /home/josh/.hushlogin'
wget -P /tmp https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
sudo dpkg -i /tmp/cloudflared-stable-linux-amd64.deb
/usr/local/bin/cloudflared update
timedatectl set-timezone Pacific/Auckland
runuser -l josh -c 'touch /home/josh/.hushlogin'
runuser -l josh -c 'git clone https://github.com/joshhighet/nebula'
runuser -l josh -c 'git clone https://github.com/joshhighet/simplesftp'
#####
ufw allow ssh
clear
git clone https://github.com/joshhighet/j.git
tree /home/josh
ufw status verbose
printf "`echo $HOSTNAME` restartin - reshell w/\nssh josh@` curl -s ipinfo.io/ip`\n"
sudo reboot
