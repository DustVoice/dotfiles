export ZNAPDOTDIR="$HOME/.znap"

ZNAPDIR="$ZNAPDOTDIR/zsh-snap"
ZNAP_ZSH="$ZNAPDIR/znap.zsh"
ZNAP_LOG="$ADOTDIR/antigen.log"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

SAVEHIST=99999999
HISTSIZE=999999999

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt COMPLETE_ALIASES

if [[ -a $ZNAP_ZSH ]]; then
    ZSH_AUTOSUGGEST_USE_ASYNC="true"
    ZSH_AUTOSUGGEST_STRATEGY=(history)
    #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=5

    ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

    MODE_CURSOR_DEFAULT="white blinking bar"
    MODE_CURSOR_VICMD="white steady block"
    MODE_CURSOR_VIINS="white blinking bar"
    MODE_CURSOR_SEARCH="cyan steady underline"
    MODE_CURSOR_REPLACE="red steady underline"
    MODE_CURSOR_VISUAL="white steady block"

    KEYTIMEOUT=5

    source $ZNAP_ZSH

    znap source ohmyzsh/ohmyzsh lib/{git,theme-and-appearance,colored-man-pages,colorzie,command-not-found,history}

    znap source marlonrichert/zsh-hist

    znap source zsh-users/zsh-completions

    znap source zsh-users/zsh-autosuggestions

    znap source zsh-users/zsh-syntax-highlighting

    znap source zsh-users/zsh-history-substring-search

    znap source softmoth/zsh-vim-mode

    bindkey -M vicmd '^K' history-substring-search-up
    bindkey -M vicmd '^J' history-substring-search-down

    bindkey -M vicmd '^H' push-line-or-edit
    bindkey -M vicmd '^L' get-line

    if [ -x "$(command -v starship)" ]; then
        znap eval starship 'starship init zsh --print-full-init'
    else
        znap prompt dustvoice/dustvoice-zsh-theme
    fi
else
    PS1=$'%b%n@%M %~
%(!.#.$) '
fi

if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

alias ls='ls --color=tty'
alias la='ls -lah'
alias ll='ls -lh'
alias lsa='ls -a'
