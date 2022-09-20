function git-proxy --wraps='git' --description 'Use git through ldiproxy'
    GIT_SSH_COMMAND='ssh -o "ProxyCommand=nc -X connect -x ldiproxy.lsjv.rlp.de:8080 %h %p"' git $argv;
end
