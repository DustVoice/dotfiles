# > Greeting
set fish_greeting
# < Greeting

# > Cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block
# < Cursor

# > Bindings
fish_vi_key_bindings --no-erase
# < Bindings

# > ENV
set -gx LANG "en_US.UTF-8"
set -gx EDITOR nvim
set -gx TERMINAL ghostty
# < ENV

# > Oh-My-Posh
if command -q oh-my-posh
    set -l config ~/.config/oh-my-posh/dustvoice.omp.yaml
    if test -e $config
        oh-my-posh init fish --config $config | source
    else
        oh-my-posh init fish | source
    end
end
# < Oh-My-Posh

# > Zoxide
if command -q zoxide
    zoxide init fish | source
end
# < Zoxide

# > Aliases
alias cz="chezmoi"
alias ljj="lazyjj"
# < Aliases
