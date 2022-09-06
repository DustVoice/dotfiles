set -x LANG "en_US.UTF-8"
set -x EDITOR "nvim"
set -x TERMINAL "alacritty"

set -x SSH_AUTH_SOCK "$(gpgconf --list-dir socketdir)/S.gpg-agent.ssh"
set -x GPG_TTY $(tty)

set -x CXXFLAGS "-std=c++14"

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH
set -x XDG_CONFIG_HOME "$HOME/.config"

set -x JUCE_PATH "$HOME/JUCE"

set -x LIBGL_ALWAYS_INDIRECT 1

set -x WINIT_X11_SCALE_FACTOR 1

set -x MOZ_ENABLE_WAYLAND 1
