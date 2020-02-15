wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb \
-O /tmp/cloudflared.deb && \
sudo apt install /tmp/cloudflared.deb && \
mkdir /etc/cloudflared && \
touch /etc/cloudflared/config.yml && \
cloudflared login && \
echo "hostname: $HOSTNAME.joshhighet.com
url: https://localhost:8000
logfile: /var/log/cloudflared.log" > /etc/cloudflared/config.yml && \
cloudflared tunnel

apk update && \
apk upgrade && \
apk add git gcc build-base && \
go get -v github.com/cloudflare/cloudflared/cmd/cloudflared && \
cloudflared login && \
echo "hostname: $HOSTNAME.joshhighet.com
url: https://localhost:8000
logfile: /var/log/cloudflared.log" > /etc/cloudflared/config.yml && \
cloudflared tunnel
