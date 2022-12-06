function xrandr-hyperv-1600-900 --description 'Resize to 1600x900 window'
    xrandr --output Virtual-1 --primary --mode 1600x900 --pos 0x0 --rotate normal
    feh-default
    polybar-launch
end
