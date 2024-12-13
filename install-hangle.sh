#!/bin/bash


#Hangle
sudo apt-get install fonts-nanum*

sudo dpkg-reconfigure locales # change to ko_KR.UTF-8

sudo apt install fcitx fcitx-hangul fonts-noto-cjk dbus-x11 # select, fcitx

sudo apt install language-selector-gnome

sudo gnome-language-selector

sudo /etc/init.d/dbus start

fcitx-config-gtk3


