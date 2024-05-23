function get-font
    set fallback_font "Fira Code:pixelsize=12:antialias=true:autohint=true"
    set font ""

    if command -q xgetres
        if not set font $(xgetres font)
            set font $fallback_font
        end
    else
        set font $fallback_font
    end

    echo "$font"
end
