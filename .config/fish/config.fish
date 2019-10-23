set fish_prompt_pwd_dir_length 0

set -x SSH_AUTH_SOCK (gpgconf --list-dir socketdir)'/S.gpg-agent.ssh'
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

set -x EDITOR 'nvim'
set -x TERMINAL 'gnome-terminal'

set -x PATH "$HOME/bin" "$HOME/.local/bin" "$HOME/JUCE" $PATH
set -x JUCE_PATH "$HOME/JUCE"
set -x FRUT_PATH "$HOME/FRUT"

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH
set -x CXXFLAGS '-std=c++14'

set -x LIBGL_ALWAYS_INDIRECT 1
