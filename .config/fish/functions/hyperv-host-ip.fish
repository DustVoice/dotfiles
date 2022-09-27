function hyperv-host-ip
    ip route show 0.0.0.0/0 dev eth0 | cut -d\  -f3
end
