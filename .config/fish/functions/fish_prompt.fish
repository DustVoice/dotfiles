function fish_prompt --description 'Write out the prompt'
    if test (id -u) -eq 0
        set prompt_symbol '#'
    else
        set prompt_symbol '$'
    end

    if test -z $WINDOW
        printf '%s%s@%s%s %s%s%s %s ' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color green) (prompt_pwd) (set_color normal) $prompt_symbol
    else
        printf '%s%s@%s%s%s (%s)%s%s%s %s ' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color white) (echo $WINDOW) (set_color green) (prompt_pwd) (set_color normal) $prompt_symbol
    end
end
