#!/bin/sh

# Source misc. environment system settings
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Wallpaper
sh .fehbg

# Enable restarting X with Ctrl+Alt+Backspace
setxkbmap -option terminate:ctrl_alt_bksp

# Remap Caps Lock to Esc
setxkbmap -option caps:escape

# Set keyboard repeat rate
# TODO maybe set it faster?
xset r rate 400 30

# Hide cursor on idle
unclutter --fork --ignore-scrolling --timeout 3

# Set cursor
xsetroot -cursor_name left_ptr

# Source .Xresources
[ -f ~/.Xresources ] && xrdb ~/.Xresources

# Redshift
# redshift &

# Tint
tint2 &

# Compositor
# compton &

# bspwm
# exec bspwm

# Openbox
exec openbox
