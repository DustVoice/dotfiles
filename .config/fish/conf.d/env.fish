set -gx LANG "en_US.UTF-8"
set -gx EDITOR "nvim"
set -gx TERMINAL "alacritty"
set -gx GIT_PAGER "delta"
set -gx DOOMPAGER "delta"

set -gx SSH_AUTH_SOCK "$(gpgconf --list-dir socketdir)/S.gpg-agent.ssh"
set -gx GPG_TTY $(tty)

set -gx CXXFLAGS "-std=c++14"

set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH
set -gx XDG_CONFIG_HOME "$HOME/.config"

set -gx JUCE_PATH "$HOME/JUCE"

set -gx LIBGL_ALWAYS_INDIRECT 1

set -gx WINIT_X11_SCALE_FACTOR 1

set -gx MOZ_ENABLE_WAYLAND 1
