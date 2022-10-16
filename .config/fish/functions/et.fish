function et --wraps='emacsclient -a "" -t' --description 'Start emacsclient (+daemon if neccessary) in terminal mode'
    emacsclient -a "" -ut $argv;
end
