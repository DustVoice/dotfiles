#!/bin/sh

dmenu_string="Wrong parameter"

case $1 in
    "rename")
        dmenu_string="Rename desktop to: " ;;
    "swap")
        dmenu_string="Swap desktop with desktop: " ;;
    "swapfollow")
        dmenu_string="Swap and follow desktop with desktop: " ;;
esac

desktop=$(bspc query -m focused -D --names | dmenu -p "$dmenu_string")

case $1 in
    "rename")
        if [[ $desktop != "" ]];
        then
            bspc desktop -n $desktop
        else
            response=$(echo "" | dmenu -p 'Really remove this desktop? (n = abort): ')

            if [[ $response != "n" ]];
            then
                bspc desktop -r
            fi
        fi
        ;;
    "swap")
        bspc desktop -s $desktop ;;
    "swapfollow")
        bspc desktop -s $desktop --follow ;;
esac
