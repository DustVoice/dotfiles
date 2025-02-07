function hyperv-gpg-agent
    set socket_path "$HOME/.gnupg/S.gpg-agent"
    set host_ip $(hyperv-host-ip)

    if test -e $socket_path
        rm $socket_path
    end

    screen -dmS gpg-socat socat UNIX-LISTEN:$socket_path,fork tcp-connect:$host_ip:59545
end

function hyperv-ssh-agent
    set socket_path "$HOME/.gnupg/S.gpg-agent.ssh"
    set host_ip $(hyperv-host-ip)

    if test -e $socket_path
        rm $socket_path
    end
    screen -dmS ssh-socat socat UNIX-LISTEN:$socket_path,fork tcp-connect:$host_ip:59546
end

function hyperv-forward --description 'Setup hyperv-agent forwarding'
    hyperv-gpg-agent
    hyperv-ssh-agent
end
