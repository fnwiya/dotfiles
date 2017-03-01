#!/bin/sh
xmodmap $HOME/.Xmodmap

gnome-settings-daemon &
gnome-volume-control-applet &
unity-settings-daemon &
xscreensaver -no-splash &
$HOME/.dropbox-dist/dropboxd &
stalonetray &
xcompmgr &

exec xmonad
