#!/bin/sh
echo -e "\e[92m
╔═╗╔═╗       ╔╗                    ╔═══╗ ╔╗       ╔╗      
║║╚╝║║       ║║                    ║╔═╗║╔╝╚╗      ║║      
║╔╗╔╗║╔══╗ ╔═╝║╔═╗ ╔══╗╔══╗╔══╗    ║╚══╗╚╗╔╝╔╗╔╗╔═╝║╔╗╔══╗
║║║║║║╚ ╗║ ║╔╗║║╔╗╗║╔╗║║══╣║══╣    ╚══╗║ ║║ ║║║║║╔╗║╠╣║╔╗║
║║║║║║║╚╝╚╗║╚╝║║║║║║║═╣╠══║╠══║    ║╚═╝║ ║╚╗║╚╝║║╚╝║║║║╚╝║
╚╝╚╝╚╝╚═══╝╚══╝╚╝╚╝╚══╝╚══╝╚══╝    ╚═══╝ ╚═╝╚══╝╚══╝╚╝╚══╝\e[0m";
#Form Input data
echo -e "\e[93mMasukan Username :\e[0m";
read userr
echo -e "\e[93mMasukan Password :\e[0m";
read pass
#method for bash
isi1=$userr
isi2=$pass
echo -e "\e[92mPlease Wait....\e[0m";
rto=0;
while [ $rto -lt 1024 ]; 
do
date
#parameter host 
status=$(curl -s --connect-timeout 10 https://www.twitter.com/robots.txt)
echo -e "\e[93mAuto Login Status :\e[0m";
#checking status connection
if [ "$status" = 'User-agent: *
Disallow: /' ];
then
	echo -e "\e[92mConnected\e[0m";
  rto=0;
elif [ "$status" != 'User-agent: *
Disallow: /' ]; 
then
	echo -e "\e[31mDisconnect\e[0m";
  ((rto++));
#Bash Autologin Wifi Id
  curl 'https://welcome2.wifi.id/authnew/login/check_login.php?ipc=10.140.98.30&gw_id=WAG-D3-LBG&mac=a0:e4:53:d6:29:35&redirect=http://www.gstatic.com/generate_204&wlan=' \
  -H 'authority: welcome2.wifi.id' \
  -H 'accept: application/json, text/javascript, */*; q=0.01' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'origin: https://welcome2.wifi.id' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://welcome2.wifi.id/login/?gw_id=WAG-D3-LBG&client_mac=a0:e4:53:d6:29:35&wlan=&sessionid=0202FFFF78045EFE-5EF44772&redirect=http://www.gstatic.com/generate_204' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'cookie: SERVERID=wpwifi3' \
  --data-raw 'username='"$isi1"'&password='"$isi2"'' \
  --compressed
fi
#Try reset IP TP-LINK
if [ "$rto" = 3 ];
then
  echo -e "\e[92mTry Renew IP....\e[0m";
#Reload ip From TP-Link
curl 'http://192.168.0.1/cgi?1' \
  -H 'Connection: keep-alive' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36' \
  -H 'Content-Type: text/plain' \
  -H 'Accept: */*' \
  -H 'Origin: http://192.168.0.1' \
  -H 'Referer: http://192.168.0.1/mainFrame.htm' \
  -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Cookie: Authorization=Basic YWRtaW46YWRtaW4=' \
  --data-binary $'[WAN_IP_CONN#1,1,2,0,0,0#0,0,0,0,0,0]0,0\r\n' \
  --compressed \
  --insecure

curl 'http://192.168.0.1/cgi?7' \
  -H 'Connection: keep-alive' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36' \
  -H 'Content-Type: text/plain' \
  -H 'Accept: */*' \
  -H 'Origin: http://192.168.0.1' \
  -H 'Referer: http://192.168.0.1/mainFrame.htm' \
  -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Cookie: Authorization=Basic YWRtaW46YWRtaW4=' \
  --data-binary $'[ACT_DHCP_RENEW#1,1,2,0,0,0#0,0,0,0,0,0]0,0\r\n' \
  --compressed \
  --insecure
elif [ "$rto" = 9 ]; 
then
  echo -e "\e[92mTry Renew IP Again :(....\e[0m";
#Reload ip From TP-Link
curl 'http://192.168.0.1/cgi?1' \
  -H 'Connection: keep-alive' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36' \
  -H 'Content-Type: text/plain' \
  -H 'Accept: */*' \
  -H 'Origin: http://192.168.0.1' \
  -H 'Referer: http://192.168.0.1/mainFrame.htm' \
  -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Cookie: Authorization=Basic YWRtaW46YWRtaW4=' \
  --data-binary $'[WAN_IP_CONN#1,1,2,0,0,0#0,0,0,0,0,0]0,0\r\n' \
  --compressed \
  --insecure

curl 'http://192.168.0.1/cgi?7' \
  -H 'Connection: keep-alive' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36' \
  -H 'Content-Type: text/plain' \
  -H 'Accept: */*' \
  -H 'Origin: http://192.168.0.1' \
  -H 'Referer: http://192.168.0.1/mainFrame.htm' \
  -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Cookie: Authorization=Basic YWRtaW46YWRtaW4=' \
  --data-binary $'[ACT_DHCP_RENEW#1,1,2,0,0,0#0,0,0,0,0,0]0,0\r\n' \
  --compressed \
  --insecure
fi
echo "RTO = "$rto;
sleep 5
done
