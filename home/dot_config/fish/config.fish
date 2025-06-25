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

# > Starship
if command -q starship
    starship init fish | source
    enable_transience
end
# < Starship

# > Zoxide
if command -q zoxide
    zoxide init fish | source
end
# < Zoxide

# > Aliases
alias cz="chezmoi"
alias ljj="lazyjj"
# < Aliases
