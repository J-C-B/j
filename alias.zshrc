alias extip="curl -s ifconfig.co"
alias extip-info="curl -s ipinfo.io | jq"
alias ipcity=`curl -s ipinfo.io | jq '.city' -r`
alias ipregion=`curl -s ipinfo.io | jq '.region' -r`
alias ipcountry=`curl -s ipinfo.io | jq '.country' -r`
alias intip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
#alias intip='ip addr show | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p''
alias ports="sudo lsof -iTCP -sTCP:LISTEN -n -P"
alias pubkey="cat ~/.ssh/id_rsa.pub"
alias cloudflaredssh="cloudflared access ssh-config --hostname"
alias die="pmset displaysleepnow"
alias ll="ls -laFTrth"
alias c='clear'
alias r='reset'
alias q='exit'
alias cd..="cd .."
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias mailgrep='grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"'
alias ipgrep="grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' -e '^\([0-9a-fA-F]\{0,4\}:\)\{1,7\}[0-9a-fA-F]\{0,4\}$'"
alias ipgrepv4="grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'"
alias ipgrepv6="grep -o '^\([0-9a-fA-F]\{0,4\}:\)\{1,7\}[0-9a-fA-F]\{0,4\}$'"
alias tor="'/Applications/Tor Browser.app/Contents/MacOS/firefox'"
alias shodanme='shodan host `curl -s ipinfo.io/ip`'
alias google='{read -r arr; open "https://google.com/search?q=${arr}";} <<<'
alias startup='echo "git clone https://github.com/joshhighet/j.git && cd j && chmod +x j.sh && ./j.sh"'
alias freewilly='docker rm $(docker ps -a -q) && docker stop $(docker ps -a -q)'
