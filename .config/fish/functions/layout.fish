function layout --wraps=xkblayout-state\ print\ \"\%s\(\%v\)\"\ \&\&\ echo\ -n\ \"\\n\" --description alias\ layout=xkblayout-state\ print\ \"\%s\(\%v\)\"\ \&\&\ echo\ -n\ \"\\n\"
    xkblayout-state print "%s(%v)" && echo -n "\n" $argv; 
end
