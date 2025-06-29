if command -q oh-my-posh
    set -l config ~/.config/oh-my-posh/dustvoice.omp.yaml
    if test -e $config
        oh-my-posh init fish --config $config | source
    else
        oh-my-posh init fish | source
    end
end
