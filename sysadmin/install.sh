#!/bin/sh

sudo cp runlights /etc/init.d/
cd ~
git clone -b dev https://github.com/dmtaub/kinet
sudo update-rc.d runlights defaults
sudo apt-get install imagemagick feh
( crontab -l 2>/dev/null | grep -Fv ipbg ; printf -- "*/3 * * * * /home/pi/APA102_Pi/sysadmin/ipbg.sh" ) | crontab

# uninstall
#sudo update-rc.d -f runlights remove
echo alias rgb=\'~/kinet/rgb.py\' >> ~/.bashrc
