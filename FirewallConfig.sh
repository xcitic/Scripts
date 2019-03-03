#!/bin/bash
#
# Made with Love by xcitic
#

echo "*******************************************************
          *** Welcome to Xcitic's World ***
      ** Answer a couple of questions before **
        ** we start setting up the firewall **
*******************************************************"
read -p 'Are you using SSH? [default = no]: ' ssh
read -p 'Are you hosting a web server with apache? [default = no]: ' apache
read -p 'Are you hosting a web server with nginx? [default = no]: ' nginx


echo '-------------------------------'
echo -e 'Setting up UFW firewall with rules'
echo '-------------------------------'
sudo ufw enable
if [ "$ssh" == "yes" ]
  then
    sudo ufw allow 22
    sudo ufw allow 'OpenSSH'
fi
if [ "$apache" == "yes" ]
  then
    sudo ufw allow 'Apache Full'
fi
if [ "$nginx" == "yes" ]
  then
    sudo ufw allow 'Nginx Full'
fi

## Deny every port except out 53,80,443 . Rules that come earlier has precendence over rules that come later.
sudo ufw deny in 1:65535/tcp
sudo ufw deny in 1:65535/udp
sudo ufw deny out 1:52/tcp
sudo ufw deny out 1:52/udp
sudo ufw deny out 54:79/tcp
sudo ufw deny out 54:79/udp
sudo ufw deny out 81:442/tcp
sudo ufw deny out 81:442/udp
sudo ufw deny out 444:65535/tcp
sudo ufw deny out 444:65535/udp
