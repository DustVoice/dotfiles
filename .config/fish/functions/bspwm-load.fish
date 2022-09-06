function bspwm-load-custom
    bspwm-workspaces-init

    if test -e $BSPWM_FILES/$argv[1]
        bspwm-save-custom $argv[2] $argv[2]
        bspc monitor -d $(< $BSPWM_FILES/$argv[1])
    end
end

function bspwm-load --description 'Load previously saved bspwm workspaces'
    bspwm-load-custom workspaces workspaces.prev_save
end
