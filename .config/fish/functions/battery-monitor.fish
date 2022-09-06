function battery-monitor --description 'Simple stat overview regarding battery charge and power supply connection'
    watch -t -n 60 '( if [ -f /sys/class/power_supply/ACAD/online ] && [ $(cat /sys/class/power_supply/ACAD/online) == "1" ]; then printf "Power connected\n"; else printf "Power disconnected\n"; fi; printf "\nBattery capacity: "; cat /sys/class/power_supply/BAT1/capacity; printf "\n(Updated every 60s)"; )'
end
