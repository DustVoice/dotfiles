HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory

source .vim.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

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

export EDITOR=nvim
export TERMINAL=gnome-terminal

export PATH=$HOME/bin:$HOME/.local/bin:$PATH:~/JUCE

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export CXXFLAGS='-std=c++14'

export LIBGL_ALWAYS_INDIRECT=1
