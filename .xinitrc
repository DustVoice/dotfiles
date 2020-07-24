#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap "us,us" ",intl" "grp:shifts_toggle"
xset m 0 0

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

mkdir -p $HOME/.local/share/bspwm
exec bspwm >$HOME/.local/share/bspwm/output.log 2>$HOME/.local/share/bspwm/error.log
