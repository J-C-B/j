####################
#joshhhighet basevm#
#################################################################################
#git clone https://github.com/joshhighet/j.git && cd j && chmod +x j.sh && ./j.sh
#################################################################################
if ! [ "$(id -u)" = 0 ]; then
  printf "j.sh needs root!"
  exit 0
fi
#################################################################################
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE !$H+H*' | /usr/bin/tee /etc/motd
/usr/sbin/adduser josh --gecos ""
/usr/sbin/usermod -aG sudo josh
/sbin/runuser -l josh -c 'mkdir /home/josh/.ssh'
/sbin/runuser -l josh -c 'touch /home/josh/.ssh/authorized_keys'
######################################
#########WAF-BYPASS-CONDITION#########
#(http.user_agent contains "curl/"####
#and http.request.method eq "GET"#####
#and http.host eq "joshhighet.com"####
#and http.request.uri.path eq "/ssh")#
######################################
/sbin/runuser -l josh -c 'curl -s -L joshhighet.com/ssh | tee /home/josh/.ssh/authorized_keys'
/sbin/runuser -l josh -c 'ssh-keygen -t rsa -b 4096 -C "autodep@joshhighet.com"'
/usr/bin/curl  -s -C - https://pkg.cloudflare.com/pubkey.gpg | /usr/bin/sudo apt-key add -
echo 'deb http://pkg.cloudflare.com/ xenial main' | /usr/bin/sudo tee /etc/apt/sources.list.d/cloudflare-main.list
/usr/bin/sudo add-apt-repository ppa:wireguard/wireguard
/usr/bin/sudo apt-get update -y
/usr/bin/sudo apt-get upgrade -y
/usr/bin/sudo apt install -y \
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
wireguard \
multitail \
moreutils \
python3-pip \
python3-virtualenv \
unattended-upgrades
/usr/bin/sudo apt autoclean -y
/usr/bin/sudo apt autoremove -y
/bin/cat /root/j/alias.zshrc >> /home/josh/.bashrc
/bin/chown -R josh:josh /home/josh
source /home/josh/.bashrc
/bin/sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo hostnamectl set-hostname `/bin/date +%s | /usr/bin/shasum -a 512 | /usr/bin/base64 | /usr/bin/head -c 8`
/sbin/runuser -l josh -c 'echo "curl -s ipinfo.io | jq" >> /home/josh/.bashrc'
/sbin/runuser -l josh -c 'touch /home/josh/.hushlogin'
/usr/bin/wget -P /tmp https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
/usr/bin/sudo dpkg -i /tmp/cloudflared-stable-linux-amd64.deb
/usr/local/bin/cloudflared update
/usr/bin/timedatectl set-timezone Pacific/Auckland
/sbin/runuser -l josh -c 'touch /home/josh/.hushlogin'
/sbin/runuser -l josh -c 'git clone https://github.com/joshhighet/nebula'
/sbin/runuser -l josh -c 'git clone https://github.com/joshhighet/simplesftp'
#####
/usr/sbin/ufw allow ssh
/usr/bin/clear
/bin/rm -rf /root/j
/usr/bin/tree /home/josh
/usr/sbin/ufw status verbose
printf "`echo $HOSTNAME` restartin - reshell w/\nssh josh@`/usr/bin/curl -s ipinfo.io/ip`\n"
/usr/bin/sudo reboot
