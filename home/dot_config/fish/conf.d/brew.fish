set brew /home/linuxbrew/.linuxbrew/bin/brew

if test -x $brew
    eval $($brew shellenv)
end
