function archserver-proxy --description 'Connect to archserver through ldiproxy'
    ssh archserver -o "ProxyCommand=nc -X connect -x ldiproxy.lsjv.rlp.de:8080 %h %p";
end
