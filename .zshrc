# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.zsh"

OH_MY_ZSH="$ZSH/oh-my-zsh.sh"

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
setopt COMPLETE_ALIASES

if [[ -a $OH_MY_ZSH ]]; then
    ZSH_AUTOSUGGEST_USE_ASYNC="true"
    ZSH_AUTOSUGGEST_STRATEGY=(history)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=5

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
    plugins=(colored-man-pages colorize command-not-found git zsh-completions zsh-autosuggestions zsh-syntax-highlighting history-substring-search zsh-vim-mode)

    autoload -U compinit && compinit

    source $OH_MY_ZSH

    bindkey -M vicmd '^K' history-substring-search-up
    bindkey -M vicmd '^J' history-substring-search-down
else
    PS1=$'%b%n@%M %~
%(!.#.$) '
fi

gpg-connect-agent updatestartuptty /bye

alias la='ls -lahF'
alias ll='ls -lhF'
alias ls='ls -F --color=tty'
alias lsa='ls -aF'
alias layout='xkblayout-state print "%s %v"'
alias picom-default='picom -bGC --backend glx --unredir-if-possible-delay 1000 --vsync'
alias screenkey-obs='screenkey --no-systray -t 2 -p fixed -s small -g 960x36+960+4 --key-mode composed --bak-mode full --mods-mode normal --scr 0 -f Hack'
alias tmate-obs='tmate -k tmk-ET35fx5m9cA7cxOt4jjWkSmaOy -r DustVoice'
alias xfce-polkit='/usr/lib/xfce-polkit/xfce-polkit'
alias davinci-resolve='/opt/resolve/bin/resolve'

alias rofi-scripts='alias | sed -e "s/=.*//"'
