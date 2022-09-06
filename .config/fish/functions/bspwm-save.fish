function bspwm-save-custom
    bspwm-workspaces-init

    if test -e $BSPWM_FILES/$argv[1]
        cp $BSPWM_FILES/$argv[1] $BSPWM_FILES/$argv[2]
    end

    bspc query -m focused -D --names | tr '\n' ' ' | sed 's/ $//g' > $BSPWM_FILES/$argv[1]
end

function bspwm-save --description 'Save current bspwm workspaces'
    bspwm-save-custom workspaces workspaces.prev_save
end
