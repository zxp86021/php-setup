#!/bin/bash

sudo apt update

#install PHP without apache
sudo apt install -y php-cli php-common php-fpm php-curl php-mysql php-xml php-readline php-tidy php-json php-mbstring php-gd php-opcache php-zip php-pear php-bcmath php-tokenizer 

#if $HOME/bin dir not exist, then create it
if [ ! -d "$HOME/bin" ] ; then
    mkdir $HOME/bin
fi

#install composer
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php --install-dir=$HOME/bin --filename=composer
php -r "unlink('composer-setup.php');"

sudo chmod +x $HOME/bin/composer
