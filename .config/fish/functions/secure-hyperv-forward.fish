function secure-hyperv-gpg-agent
    set socket_path "/dev/shm/gpg/.gnupg/S.gpg-agent"
    set host_ip $(hyperv-host-ip)

    if test -e $socket_path
        rm $socket_path
    end

    screen -dmS gpg-socat socat UNIX-LISTEN:$socket_path,fork tcp-connect:$host_ip:59545
end

function secure-hyperv-ssh-agent
    set socket_path "/dev/shm/gpg/.gnupg/S.gpg-agent.ssh"
    set host_ip $(hyperv-host-ip)

    if test -e $socket_path
        rm $socket_path
    end
    screen -dmS ssh-socat socat UNIX-LISTEN:$socket_path,fork tcp-connect:$host_ip:59546
end

function secure-hyperv-forward --description 'Setup secure hyperv-agent forwarding'
    secure-hyperv-gpg-agent
    secure-hyperv-ssh-agent
end
