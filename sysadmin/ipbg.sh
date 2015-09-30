#!/bin/bash  
export DISPLAY=:0.0
# Create white background image
convert -size 640x400 xc:white /tmp/base.jpg

POINT=50
TOP=30
LINE1H=`expr $POINT \* 3 + $TOP`
LINE2H=`expr $POINT \* 4 + $TOP`
LINE3H=`expr $POINT \* 6 + $TOP`
DATE=`date +"%a %b %d %Y %H:%M:%S"`
FINAL_IMG=/home/pi/bg_ip.jpg
# Create IP image
convert /tmp/base.jpg -pointsize $POINT -fill lime -draw "text 0,$LINE1H 'IPv4: $(ip -4 a s eth0 | grep -Eo 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk '{print $2}')'" -fill black -draw "text -0,$LINE2H '$(whoami)@$(uname -n)'" -pointsize $POINT -draw "text -0,$LINE3H '$DATE'" $FINAL_IMG

#xsetroot -bitmap bg_ip.xbm
#pcmanfm --set-wallpaper=bg_ip.jpg

# Uncomment this one if you're not using gnome:  
#killall feh
#feh ./bg_ip.jpg  &

pcmanfm --set-wallpaper $FINAL_IMG --wallpaper-mode=center

#sudo ln -fs `pwd`/bg_ip.jpg /etc/alternatives/desktop-background

xset s reset #unblank screen
echo `date` --running

# and place a # (hash) for the following rule:   
#gconftool -t string -s /desktop/gnome/background/picture_filename ./ip.jpg  

#lrwxrwxrwx 1 root root 52 May  6 23:02 /etc/alternatives/desktop-background -> /usr/share/raspberrypi-artwork/raspberry-pi-logo.png
#ln -fs /usr/share/raspberrypi-artwork/raspberry-pi-logo.png /etc/alternatives/desktop-background

