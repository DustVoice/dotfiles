function hyperv-gpg-agent
    set socket_path "$HOME/.gnupg/S.gpg-agent"
    set host_ip $(ip route show 0.0.0.0/0 dev eth0 | cut -d\  -f3)

    if test -e $socket_path
        rm $socket_path
    end

    setsid socat UNIX-LISTEN:$socket_path,fork tcp-connect:$host_ip:59545 &
end

function hyperv-ssh-agent
    set socket_path "$HOME/.gnupg/S.gpg-agent.ssh"
    set host_ip $(ip route show 0.0.0.0/0 dev eth0 | cut -d\  -f3)

    if test -e $socket_path
        rm $socket_path
    end

    setsid socat UNIX-LISTEN:$socket_path,fork tcp-connect:$host_ip:59546 &
end

function hyperv-forward --description 'Setup hyperv-agent forwarding'
    hyperv-gpg-agent
    hyperv-ssh-agent
end
