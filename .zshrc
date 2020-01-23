# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dustvoice"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_AUTOSUGGEST_STRATEGY=(history)

MODE_CURSOR_DEFAULT="white blinking bar"
MODE_CURSOR_VICMD="magenta steady block"
MODE_CURSOR_VIINS="white blinking bar"
MODE_CURSOR_SEARCH="cyan steady underline"
MODE_CURSOR_REPLACE="red steady underline"
MODE_CURSOR_VISUAL="magenta steady block"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(colored-man-pages colorize command-not-found git zsh-autosuggestions zsh-syntax-highlighting history-substring-search zsh-vim-mode)

source $ZSH/oh-my-zsh.sh

bindkey -M vicmd 'K' history-substring-search-up
bindkey -M vicmd 'J' history-substring-search-down

bindkey -M vicmd 'L' autosuggest-accept
bindkey -M vicmd 'H' autosuggest-clear
bindkey -M vicmd '$' autosuggest-accept
bindkey -M vicmd '0' autosuggest-clear

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
gpg-connect-agent updatestartuptty /bye

export EDITOR=nvim
export TERMINAL=gnome-terminal

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:~/JUCE
export JUCE_PATH=~/JUCE
export FRUT_PATH=~/FRUT

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export CXXFLAGS='-std=c++14'

export LIBGL_ALWAYS_INDIRECT=1

alias la='ls -lahF'
alias ll='ls -lhF'
alias ls='ls -F --color=tty'
alias lsa='ls -aF'
alias layout='xkblayout-state print "%s %v"'
alias picom-default='picom -bGC --backend glx --unredir-if-possible-delay 1000 --vsync'
alias screenkey-obs='screenkey --no-systray -t 2 -p fixed -s small -g 960x36+960+4 --key-mode composed --bak-mode full --mods-mode normal --scr 0 -f Hack'
alias tmate-obs='tmate -k tmk-ET35fx5m9cA7cxOt4jjWkSmaOy -r DustVoice'
alias xfce-polkit='/usr/lib/xfce-polkit/xfce-polkit'
