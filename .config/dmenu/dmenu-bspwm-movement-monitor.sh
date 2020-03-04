#!/bin/sh

dmenu_string="Wrong parameter"

case $1 in
    "goto")
        dmenu_string="Switch to monitor: " ;;
    "swap")
        dmenu_string="Swap monitor with monitor: " ;;
    "movenode")
        dmenu_string="Move node to monitor: " ;;
    "movenodefollow")
        dmenu_string="Move and follow node to monitor: " ;;
    "movedesktop")
        dmenu_string="Move desktop to monitor: " ;;
    "movedesktopfollow")
        dmenu_string="Move and follow desktop to monitor: " ;;
esac

monitor=$(bspc query -M --names | dmenu -p "$dmenu_string")

case $1 in
    "goto")
        bspc monitor -f $monitor ;;
    "swap")
        bspc monitor -s $monitor ;;
    "movenode")
        bspc node -m $monitor ;;
    "movenodefollow")
        bspc node -m $monitor --follow ;;
    "movedesktop")
        bspc desktop -m $monitor ;;
    "movedesktopfollow")
        bspc desktop -m $monitor --follow ;;
esac
