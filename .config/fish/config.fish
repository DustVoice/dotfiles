if command -q starship
    starship init fish | source
end

if command -q zoxide
    zoxide init fish | source
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
