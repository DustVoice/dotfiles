
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/dustvoice/miniforge3/bin/conda
    eval /home/dustvoice/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/dustvoice/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/dustvoice/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/dustvoice/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

