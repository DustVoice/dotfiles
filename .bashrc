# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

gpg-agent --daemon
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

export EDITOR=nvim
export TERMINAL=gnome-terminal

export PATH=~/JUCE:$PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export CXXFLAGS='-std=c++14'

export LIBGL_ALWAYS_INDIRECT=1
