function usbip-man --description "Interactive usbip helper"
    set vhci_required

    echo ">> Is the vhci-hcd module already loaded?"
    echo ">> [(y)es] / (n)o"

    read vhci_required

    if test "$vhci_required" = "n"
        sudo modprobe vhci-hcd
    end

    set action

    echo ">> What do you want to do?"
    echo ">> [(a)ttach] / (d)etach"

    read action

    if test "$action" = "a" || test "$action" = ""
        set host
        set host_type
        set bus_id

        echo ">> What kind of setup is it?"
        echo ">> [(h)yperv]"

        read host_type

        if test "$host_type" = "h" || test "$host_type" = ""
            set host $(hyperv-host-ip)
        else
            echo ">> No valid option chosen. Exiting ..."
            return -1
        end

        echo ">> Listing available devices ..."
        sudo usbip list -r "$host"

        echo ">> Select bus-id to attach"

        read bus_id

        echo ">> Attaching device ..."
        sudo usbip attach -r "$host" -b "$bus_id"
        set usbip_status $status

        echo ">> Exiting ..."
        return $usbip_status
    else if [ "$action" = "d" ]
        set port

        echo ">> Listing imported devices ..."
        sudo usbip port

        echo ">> Select port to detach"

        read port

        echo ">> Detaching device ..."
        sudo usbip detach -p "$port"
        set usbip_status $status

        echo ">> Exiting ..."
        return $usbip_status
    else
        echo ">> No valid option chosen. Exiting ..."
        return -1
    end
end
