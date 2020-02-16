#speedtest over schelle
yes | pv | ssh user@dest "cat >/dev/null"
#view all USB interfaces
osqueryi --json 'SELECT * FROM usb_devices WHERE removable' | jq
#view tha listening ports
sudo lsof -iTCP -sTCP:LISTEN -n -P
#view local addresses
#broken on catalina ## hostname -i | awk '{print $3}'
#view external address
curl -s ipinfo.io | jq
