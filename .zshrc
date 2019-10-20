HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory

bindkey -v

terminfo_down_sc=$terminfo[cud1]$terminfo[cud1]$terminfo[cuu1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]$terminfo[cud1]
#terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]

function insert-mode () { echo "%S%F{cyan} -- INSERT -- %f%s" }
function normal-mode () { echo "%S%F{green} -- NORMAL -- %f%s" }

precmd () {
    PS1="%{$terminfo_down_sc$VI_MODE$terminfo[rc]%}%F{magenta}%n%f@%F{yellow}%m%f %F{green}%~%f %(!.#.$) "
}

function zle-keymap-select () {
    VI_KEYMAP=$KEYMAP

    case ${VI_KEYMAP} in
        (vicmd)         VI_MODE="$(normal-mode)" ;;
        (main|viins)    VI_MODE="$(insert-mode)" ;;
        (*)             VI_MODE="$(insert-mode)" ;;
    esac

    [[ -n "$VI_MODE_KEEP_CURSOR" ]] || if [[ "$VI_KEYMAP" == "vicmd" ]]; then
        print -n '\e[1 q'
    else
        print -n '\e[5 q'
    fi

    PS1="%{$terminfo_down_sc$VI_MODE$terminfo[rc]%}%F{magenta}%n%f@%F{yellow}%m%f %B%F{cyan}%~%f%b %(!.#.$) "

    zle reset-prompt
    zle -R
}

function zle-line-init() {
    zle -K viins
}

preexec () { print -rn -- $terminfo[el]; }

zle -N zle-line-init
zle -N zle-keymap-select

function _vi_mode_reset_cursor() {
    [[ -n "$VI_MODE_KEEP_CURSOR" ]] || print -n '\e[1 q'
}
autoload -U add-zsh-hook
add-zsh-hook preexec _vi_mode_reset_cursor

export KEYTIMEOUT=1

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

export PATH=$HOME/bin:$HOME/.local/bin:$PATH:~/JUCE
export JUCE_PATH=~/JUCE
export FRUT_PATH=~/FRUT

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export CXXFLAGS='-std=c++14'

export LIBGL_ALWAYS_INDIRECT=1
