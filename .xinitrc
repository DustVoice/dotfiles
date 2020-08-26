#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap "us,us" ",intl" "grp:shifts_toggle"
xset m 0 0
xsetroot -cursor_name left_ptr

export _JAVA_AWT_WM_NONPARENTING=1

mkdir -p $HOME/.local/share/bspwm
exec bspwm >$HOME/.local/share/bspwm/output.log 2>$HOME/.local/share/bspwm/error.log
