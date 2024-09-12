# === Init ===
xontrib load coreutils

$FORCE_POSIX_PATHS = True
$VI_MODE = True

# = carapace-bin =
COMPLETIONS_CONFIRM=True
exec($(carapace _carapace))

# = oh-my-posh =
execx($(oh-my-posh init xonsh --config ~/catppuccin_macchiato.omp.json))

# = zoxide =
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')

# === Aliases ===
aliases['es'] = 'eza --git --icons'
aliases['esa'] = 'eza -a --git --icons'
aliases['el'] = 'eza -lh --git --icons'
aliases['ela'] = 'eza -lah --git --icons'
aliases['et'] = 'eza -lTh --git --icons'
aliases['eta'] = 'eza -lTah --git --icons'
