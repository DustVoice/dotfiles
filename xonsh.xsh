# === Init ===
xontrib load coreutils

$FORCE_POSIX_PATHS = True
$VI_MODE = True

# = carapace-bin =
COMPLETIONS_CONFIRM=True
exec($(carapace _carapace))

# = zoxide =
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')

# = starship =
{{#if (eq dotter.os "windows")}}
import uuid

def starship_prompt():
    last_cmd = __xonsh__.history[-1] if __xonsh__.history else None
    status = last_cmd.rtn if last_cmd else 0
    # I believe this is equivalent to xonsh.jobs.get_next_job_number() for our purposes,
    # but we can't use that function because of https://gitter.im/xonsh/xonsh?at=60e8832d82dd9050f5e0c96a
    jobs = sum(1 for job in __xonsh__.all_jobs.values() if job['obj'] and job['obj'].poll() is None)
    duration = round((last_cmd.ts[1] - last_cmd.ts[0]) * 1000) if last_cmd else 0
    return $(starship prompt --status=@(status) --jobs=@(jobs) --cmd-duration=@(duration))

def starship_rprompt():
    last_cmd = __xonsh__.history[-1] if __xonsh__.history else None
    status = last_cmd.rtn if last_cmd else 0
    # I believe this is equivalent to xonsh.jobs.get_next_job_number() for our purposes,
    # but we can't use that function because of https://gitter.im/xonsh/xonsh?at=60e8832d82dd9050f5e0c96a
    jobs = sum(1 for job in __xonsh__.all_jobs.values() if job['obj'] and job['obj'].poll() is None)
    duration = round((last_cmd.ts[1] - last_cmd.ts[0]) * 1000) if last_cmd else 0
    return $(starship prompt --status=@(status) --jobs=@(jobs) --cmd-duration=@(duration) --right)

$PROMPT = starship_prompt
$RIGHT_PROMPT = starship_rprompt
$STARSHIP_SHELL = "xonsh"
$STARSHIP_SESSION_KEY = uuid.uuid4().hex
{{else}}
execx($(starship init xonsh))
{{/if}}

# === Aliases ===
aliases['es'] = 'eza --git --icons'
aliases['esa'] = 'eza -a --git --icons'
aliases['el'] = 'eza -lh --git --icons'
aliases['ela'] = 'eza -lah --git --icons'
aliases['et'] = 'eza -lTh --git --icons'
aliases['eta'] = 'eza -lTah --git --icons'

# === Fix for WSL ===
[$PATH.remove(path) for path in $PATH.paths if path.startswith("/mnt/c/")]
