#!/bin/sh
xmodmap $HOME/.Xmodmap

$HOME/.dropbox-dist/dropboxd &
gnome-volume-control-applet &
stalonetray -i 1 --geometry 6x1-0-0 -bg white &

gnome-settings-daemon &
xcompmgr &

exec xmonad
