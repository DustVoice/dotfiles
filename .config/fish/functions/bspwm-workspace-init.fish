function bspwm-workspaces-init
    if not set -q BSPWM_FILES
        set -x BSPWM_FILES "$HOME/.local/share/bspwm"
    end

    mkdir -p $BSPWM_FILES
end
