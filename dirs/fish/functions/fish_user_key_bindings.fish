function fish_user_key_bindings
    fish_vi_key_bindings

    bind \f            'accept-autosuggestion'
    bind \b            'cancel-commandline'
    bind \f  -M insert 'accept-autosuggestion'
    bind \b  -M insert 'cancel-commandline'
    bind \cE           'edit_command_buffer'
    bind \cE -M insert 'edit_command_buffer'
end
