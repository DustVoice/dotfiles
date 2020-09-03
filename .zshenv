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

export BSPWM_FILES="$HOME/.local/share/bspwm"

if [[ -f $HOME/.zsh_alias ]]; then
    source $HOME/.zsh_alias
fi
