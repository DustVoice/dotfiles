typeset -U PATH path MANPATH LD_LIBRARY_PATH

MANPATH="/usr/local/man:$MANPATH"
export MANPATH

# You may need to manually set your language environment
LANG=en_US.UTF-8
export LANG

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

EDITOR='nvim'
export EDITOR

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

SSH_AUTH_SOCK="$(gpgconf --list-dir socketdir)/S.gpg-agent.ssh"
export SSH_AUTH_SOCK

GPG_TTY=$(tty)
export GPG_TTY

TERMINAL='xfce4-terminal'
export TERMINAL

path=("$HOME/bin" "$HOME/.local/bin" "/usr/local/bin" "$path[@]" "$HOME/JUCE")
export PATH

JUCE_PATH='~/JUCE'
export JUCE_PATH

FRUT_PATH='~/FRUT'
export FRUT_PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

CXXFLAGS='-std=c++14'
export CXXFLAGS

LIBGL_ALWAYS_INDIRECT=1
export LIBGL_ALWAYS_INDIRECT

alias la='ls -lahF'
alias ll='ls -lhF'
alias ls='ls -F --color=tty'
alias lsa='ls -aF'
alias layout='xkblayout-state print "%s %v"'
alias picom-default='picom -bGC --backend glx --unredir-if-possible-delay 1000 --vsync'
alias screenkey-obs='screenkey --no-systray -t 2 -p fixed -s small -g 960x36+960+4 --key-mode composed --bak-mode full --mods-mode normal --scr 0 -f Hack'
alias tmate-obs='tmate -k tmk-ET35fx5m9cA7cxOt4jjWkSmaOy -r DustVoice'
alias xfce-polkit='/usr/lib/xfce-polkit/xfce-polkit'

alias rofi-scripts='alias | sed -e "s/=.*//"'
