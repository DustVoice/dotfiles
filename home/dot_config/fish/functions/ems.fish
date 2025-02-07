function ems --wraps='emacsclient -a "" -nc "/sudo:root@localhost:"' --description 'Start emacsclient (+daemon if neccessary) with sudo'
    emacsclient -a "" -nc "/sudo:root@localhost:$argv";
end
