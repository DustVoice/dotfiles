function fish_user_key_bindings
    fish_vi_key_bindings

    bind \f  -M insert 'accept-autosuggestion'
    bind \b  -M insert 'cancel-commandline'
    bind \v            'up_or_search'
    bind \n            'down_or_search'
    bind \cE -M insert 'edit_command_buffer'
end
