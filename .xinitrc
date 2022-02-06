#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
env=$HOME/.zshenv

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

if [ -x "$env" ]; then
    . "$env"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap "us,us" ",intl" "grp:shifts_toggle"

xset s off
xset m 1 1
xset dmps 300 600 0
xsetroot -cursor_name left_ptr

export _JAVA_AWT_WM_NONPARENTING=1

if [ -n $BSPWM_FILES ]; then
    mkdir -p $BSPWM_FILES
    exec bspwm >$BSPWM_FILES/output.log 2>$BSPWM_FILES/error.log
else
    exec bspwm
fi
