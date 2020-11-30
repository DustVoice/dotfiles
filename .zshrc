# Path to your oh-my-zsh installation.
export ADOTDIR="$HOME/.antigen"

ANTIGEN_ZSH="$ADOTDIR/antigen.zsh"
ANTIGENRC="$HOME/.antigenrc"
ANTIGEN_LOG="$ADOTDIR/antigen.log"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dustvoice"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

if [[ -a $ANTIGEN_ZSH && -a $ANTIGENRC ]]; then
    ZSH_AUTOSUGGEST_USE_ASYNC="true"
    ZSH_AUTOSUGGEST_STRATEGY=(history)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=5

    MODE_CURSOR_DEFAULT="white blinking bar"
    MODE_CURSOR_VICMD="white steady block"
    MODE_CURSOR_VIINS="white blinking bar"
    MODE_CURSOR_SEARCH="cyan steady underline"
    MODE_CURSOR_REPLACE="red steady underline"
    MODE_CURSOR_VISUAL="white steady block"

    source $ANTIGEN_ZSH

    antigen init $ANTIGENRC

    autoload -U compinit && compinit

    bindkey -M vicmd '^K' history-substring-search-up
    bindkey -M vicmd '^J' history-substring-search-down

    KEYTIMEOUT=5
else
    PS1=$'%b%n@%M %~
%(!.#.$) '
fi
