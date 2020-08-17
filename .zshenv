typeset -TUx PATH path
typeset -TUx LD_LIBRARY_PATH ld_library_path

path=("$HOME/bin" "$HOME/.local/bin" "/usr/local/bin" "$path[@]")

if [[ -f $HOME/.zshpath ]]; then
    source $HOME/.zshpath
fi

ld_library_path=("$LD_LIBRARY_PATH")

# You may need to manually set your language environment
export LANG='en_US.UTF-8'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export SSH_AUTH_SOCK="$(gpgconf --list-dir socketdir)/S.gpg-agent.ssh"
export GPG_TTY=$(tty)

export TERMINAL='st'

export JUCE_PATH="$HOME/JUCE"

export CXXFLAGS='-std=c++14'

export LIBGL_ALWAYS_INDIRECT=1

export XDG_CONFIG_HOME="$HOME/.config"

export WINIT_X11_SCALE_FACTOR=1

alias layout='xkblayout-state print "%s %v"'
alias picom-default='picom -bgc --backend glx --unredir-if-possible-delay 1000 --vsync'
alias screenkey-obs='screenkey --no-systray -t 2 -p fixed -s small -g 960x88+960+4 --key-mode composed --bak-mode full --mods-mode normal -f Hack --font-color "#f8f8f2" --bg-color "#44475a" --opacity "1.0"'
alias tmate-obs='tmate -k tmk-et35fx5m9ca7cxot4jjwksmaoy -r dustvoice'
alias xfce-polkit='/usr/lib/xfce-polkit/xfce-polkit'
alias davinci-resolve='/opt/resolve/bin/resolve'

alias rofi-scripts='alias | sed -e "s/=.*//"'
