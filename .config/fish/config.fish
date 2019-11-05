set -U __fish_init_2_39_8 \x1d
set -U __fish_init_2_3_0 \x1d
set -U __fish_init_3_x \x1d
set -U fish_color_autosuggestion 969896
set -U fish_color_cancel \x2dr
set -U fish_color_command b294bb
set -U fish_color_comment f0c674
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end b294bb
set -U fish_color_error cc6666
set -U fish_color_escape 00a6b2
set -U fish_color_history_current \x2d\x2dbold
set -U fish_color_host normal
set -U fish_color_match \x2d\x2dbackground\x3dbrblue
set -U fish_color_normal normal
set -U fish_color_operator 00a6b2
set -U fish_color_param 81a2be
set -U fish_color_quote b5bd68
set -U fish_color_redirection 8abeb7
set -U fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
set -U fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path \x2d\x2dunderline
set -U fish_cursor_default block
set -U fish_cursor_insert line
set -U fish_cursor_replace_one underscore
set -U fish_greeting 
set -U fish_key_bindings fish_vi_key_bindings
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D\x1eyellow
set -U fish_pager_color_prefix white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set -U fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan

set fish_prompt_pwd_dir_length 0

set -x SSH_AUTH_SOCK (gpgconf --list-dir socketdir)'/S.gpg-agent.ssh'
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

set -x EDITOR 'nvim'
set -x TERMINAL 'gnome-terminal'

set -x PATH "$HOME/bin" "$HOME/.local/bin" "$HOME/JUCE" "$HOME/.gem/ruby/2.6.0/bin" $PATH
set -x JUCE_PATH "$HOME/JUCE"
set -x FRUT_PATH "$HOME/FRUT"

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH
set -x CXXFLAGS '-std=c++14'

set -x LIBGL_ALWAYS_INDIRECT 1
