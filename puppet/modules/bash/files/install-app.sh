#!/bin/sh

cd /home/vagrant/app
sudo composer update
app/console doctrine:database:create

if [ -f bin/install.sh ]
then
    bin/install.sh
fi
