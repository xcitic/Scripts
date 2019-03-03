#!/bin/bash
# This script automates the setup of Composer, Laravel, NodeJS, NPM and Docker.
#
# Made with Love by xcitic
#


echo "*******************************************************
          *** Welcome to Xcitic's World ***
            ** Preparing your system. **
*******************************************************"
sudo apt-get update
sudo apt-get upgrade

echo "*******************************************************
          *** Installing PHP, Composer & Laravel ***
*******************************************************"
sudo apt-get install -y php php-curl php-dom php-json php-pgsql php-tokenizer php-xml php-mysql \
mcrypt php-bcmath php-intl php-zip composer
composer global require laravel/installer

# Adding Path variable to bashrc
if [ -d "$HOME/.config/composer/vendor/bin" ]; then
  echo PATH="$HOME/.config/composer/vendor/bin:$PATH" >> ~/.bashrc
fi
# Reloading bashrc
source ~/.bashrc

echo "*******************************************************
          *** Laravel Installed ***
          *** Setting up Docker ***
*******************************************************"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# If error with the install (404 for the repo) then edit the repo file and change the distro to parent distro
# This happens on Linux Mint which returns lsb_release = tessa while really using bionic repos

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "*******************************************************
          *** Docker & docker-compose installed ***
              *** Setting up NodeJS & NPM ***
*******************************************************"
sudo apt-get install -y npm


echo "*******************************************************
          *** All Done!  ***
*******************************************************"
