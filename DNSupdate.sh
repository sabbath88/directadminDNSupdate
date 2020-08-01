#!/bin/bash
user=""
password=""
server=""
domain=""
subdomain=""
newIP=`dig +short myip.opendns.com @resolver1.opendns.com`
#Check IP saved in DirectAdmin
IP=`curl -s --max-time 15 --user $user:$password "${server}/CMD_API_DNS_CONTROL?domain=${domain}" |grep -i cloud |cut -c 18-`
if [ "$newIP" != "$IP" ]
then
  #del
   curl -s --max-time 15 --user $user:$password "${server}/CMD_API_DNS_CONTROL?domain=${domain}&action=select&arecs0=name%3D${subdomain}" 1>/dev/null 2>&1
  #add
   curl -s --max-time 15 --user $user:$password "${server}/CMD_API_DNS_CONTROL?domain=${domain}&action=add&type=A&name=${subdomain}&value=${newIP}" 1>/dev/null 2>&1
fi
