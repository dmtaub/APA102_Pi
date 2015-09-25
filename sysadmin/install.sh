#!/bin/sh

sudo cp runlights /etc/init.d/
sudo update-rc.d runlights defaults

# uninstall
#sudo update-rc.d -f runlights remove
