#!/bin/sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install imagemagick feh python-dev python-pip
sudo pip install spidev


sudo cp runlights /etc/init.d/
sudo update-rc.d runlights defaults

( crontab -l 2>/dev/null | grep -Fv ipbg ; printf -- "*/3 * * * * /home/pi/APA102_Pi/sysadmin/ipbg.sh" ) | crontab

# uninstall
#sudo update-rc.d -f runlights remove
