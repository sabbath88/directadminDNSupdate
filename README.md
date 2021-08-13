# directadminDNSupdate
Simple script to helps if you have home lab server that its not always get the same public IP.
Script checks current WAN IP and if it is different than the one that is bonded to DNS record of your subdomain, then updates it via Direct Admin API.

eg: <br>
user="admin"<br>
password="********"<br>
server="https://ovh.org:2223"<br>
domain="google.com"<br>
subdomain="maps"
