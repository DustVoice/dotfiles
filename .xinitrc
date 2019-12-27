#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap "us,us" ",intl" "grp:alt_shift_toggle"
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

exec i3
