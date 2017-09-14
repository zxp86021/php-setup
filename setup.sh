#!/bin/bash

#install PHP without apache
sudo apt install -y php-cli php-common php-fpm php-curl php-mysql php-xml php-readline php-tidy php-json php-mcrypt php-mbstring php-gd php-opcache php-zip php-pear

#if $HOME/bin dir not exist, then create it
if [ ! -d "$HOME/bin" ] ; then
    mkdir $HOME/bin
fi

#install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=$HOME/bin --filename=composer
php -r "unlink('composer-setup.php');"

sudo chmod +x $HOME/bin/composer
