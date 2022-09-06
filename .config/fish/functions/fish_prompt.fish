function fish_prompt --description 'Write out the prompt'
    if test (id -u) -eq 0
        set prompt_symbol '#'
    else
        set prompt_symbol '$'
    end

    set -l prompt_prefix (set_color yellow)(whoami)'@'(set_color purple)(prompt_hostname)' '
    set -l prompt_dir (set_color green)(prompt_pwd)

    set -l column_aware_prompt (construct_column_aware_prompt $prompt_prefix $prompt_dir)

    if test -z $WINDOW
        for dir in $column_aware_prompt
            echo $dir
        end

        set_color normal

        echo $prompt_symbol' '
    else
        printf '%s%s@%s%s%s (%s)%s%s%s\n%s ' (set_color yellow) (whoami) (set_color purple) (prompt_hostname) (set_color white) (echo $WINDOW) (set_color green) (prompt_pwd) (set_color normal) $prompt_symbol
    end
end
