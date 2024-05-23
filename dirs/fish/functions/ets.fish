function ets --wraps='emacsclient -a "" -t "/sudo:root@localhost:"' --description 'Start emacsclient (+daemon if neccessary) in terminal mode with sudo'
    emacsclient -a "" -ut "/sudo:root@localhost:$argv";
end
