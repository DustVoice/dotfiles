function screenkey-obs
    set width $(xrandr | awk '$0 ~ "*" {split($1,res,"x"); print res[1];}')
    set height $(xrandr | awk '$0 ~ "*" {split($1,res,"x"); print res[2];}')
    screenkey --no-systray -t 2 -p fixed -s small -g $(awk -v height=$height -v width=$width 'BEGIN {printf "%.0fx%.0f+%.0f+%.0f", (width * 0.5), (height * 0.06), (width * 0.25), (height * 0.02)}') --key-mode composed --bak-mode full --mods-mode normal -f "Fira Code" --font-color "#f8f8f2" --bg-color "#44475a" --opacity "1.0"
end
