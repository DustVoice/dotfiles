function dmenu_fish --description 'Open fish agnostic dmenu'
    set fns "$(string replace -a ', ' \n $(functions))"

    set command_to_run $(string join \n $fns $(dmenu_path) | sort | dmenu -i -fn "$(get-font)" -nb "#282a36" -nf "#f8f8f2" -sb "#44475a" -sf "#f8f8f2")

    fish -c "$command_to_run" &
end
