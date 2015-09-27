#!/bin/sh

sudo cp runlights /etc/init.d/
sudo update-rc.d runlights defaults
sudo apt-get install imagemagick feh
# uninstall
#sudo update-rc.d -f runlights remove
