#!/bin/sh
echo -e "\e[92m
╔═╗╔═╗       ╔╗                    ╔═══╗ ╔╗       ╔╗      
║║╚╝║║       ║║                    ║╔═╗║╔╝╚╗      ║║      
║╔╗╔╗║╔══╗ ╔═╝║╔═╗ ╔══╗╔══╗╔══╗    ║╚══╗╚╗╔╝╔╗╔╗╔═╝║╔╗╔══╗
║║║║║║╚ ╗║ ║╔╗║║╔╗╗║╔╗║║══╣║══╣    ╚══╗║ ║║ ║║║║║╔╗║╠╣║╔╗║
║║║║║║║╚╝╚╗║╚╝║║║║║║║═╣╠══║╠══║    ║╚═╝║ ║╚╗║╚╝║║╚╝║║║║╚╝║
╚╝╚╝╚╝╚═══╝╚══╝╚╝╚╝╚══╝╚══╝╚══╝    ╚═══╝ ╚═╝╚══╝╚══╝╚╝╚══╝\e[0m";

echo -e "\e[93mMasukan Username :\e[0m";
read userr
echo -e "\e[93mMasukan Password :\e[0m";
read pass

isi1=$userr
isi2=$pass
while :
do
date


status=$(curl -s --connect-timeout 10 https://www.twitter.com/robots.txt)
echo -e "\e[93mAuto Login Status :\e[0m";

if [ "$status" = 'User-agent: *
Disallow: /' ]
then
	echo -e "\e[92mConnected\e[0m";
else
	echo -e "\e[31mDisconnect\e[0m";

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

sleep 5
done
