function picom-default --wraps='picom -bGC --backend glx --unredir-if-possible-delay 1000 --vsync' --description 'alias picom-default=picom -bGC --backend glx --unredir-if-possible-delay 1000 --vsync'
    picom -bGC --backend glx --unredir-if-possible-delay 1000 --vsync $argv; 
end
