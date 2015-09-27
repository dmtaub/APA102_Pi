#!/bin/bash  
export DISPLAY=:0.0
# Create white background image
convert -size 1280x800 xc:white /tmp/base.jpg

# Create IP image
convert /tmp/base.jpg -pointsize 80 -fill lime -draw "text 0,150 'IPv4: $(ip -4 a s eth0 | grep -Eo 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk '{print $2}')'" -fill black -draw "text -0,250 'Hostname: $(uname -n)'" -pointsize 60 -draw "text -0,500 'Date $(date)'" bg_ip.jpg

#xsetroot -bitmap bg_ip.xbm
#pcmanfm --set-wallpaper=bg_ip.jpg
# Uncomment this one if you're not using gnome:  
#feh --bg-scale ./ip.jpg  
# and place a # (hash) for the following rule:   
#gconftool -t string -s /desktop/gnome/background/picture_filename ./ip.jpg  

xset s reset
#lrwxrwxrwx 1 root root 52 May  6 23:02 /etc/alternatives/desktop-background -> /usr/share/raspberrypi-artwork/raspberry-pi-logo.png
#ln -fs `pwd`/bg_ip.jpg /etc/alternatives/desktop-background
#ln -fs /usr/share/raspberrypi-artwork/raspberry-pi-logo.png /etc/alternatives/desktop-background

