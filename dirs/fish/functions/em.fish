function em --wraps='emacsclient -a "" -nc' --description 'Start emacsclient (+daemon if neccessary)'
    emacsclient -a "" -nc $argv;
end
