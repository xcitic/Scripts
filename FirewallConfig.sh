#!/bin/bash
echo Before setting up the firewall I need to know some things:
read -p 'Are you using SSH? [default = no]: ' ssh
read -p 'Are you hosting a web server with apache? [default = no]: ' apache
read -p 'Are you hosting a web server with nginx? [default = no]: ' nginx


echo '-------------------------------'
echo -e 'Setting up UFW firewall with rules'
echo '-------------------------------'
sudo ufw enable
if [ "$ssh" = "yes" ]
  then
    sudo ufw allow 22
fi
if [ "$apache" = "yes" ]
  then
    sudo ufw allow apache
    sudo ufw allow in 80
    sudo ufw allow in 443
fi
if [ "$nginx" = "yes" ]
  then
    sudo ufw allow nginx
    sudo ufw allow in 80
    sudo ufw allow in 443
fi

sudo ufw deny in 1:65535/tcp
sudo ufw deny in 1:65535/udp
sudo ufw deny out 1:52/tcp
sudo ufw deny out 1:52/udp
sudo ufw deny out 54:79/tcp
sudo ufw deny out 54:79/udp
sudo ufw deny out 81:442/tcp
sudo ufw deny out 81:442/udp
sudo ufw deny out 444:65535/tcp
sudo ufw deny out 444:65535/tcp
