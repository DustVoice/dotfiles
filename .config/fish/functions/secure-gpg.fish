function secure-gpg --wraps='gpg --homedir /dev/shm/gpg/.gnupg' --description 'gpg --homedir /dev/shm/gpg/.gnupg'
    gpg --homedir /dev/shm/gpg/.gnupg $argv; 
end
