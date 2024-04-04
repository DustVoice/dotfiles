# === Init ===
xontrib load coreutils

# carapace-bin
COMPLETIONS_CONFIRM=True
exec($(carapace _carapace))

# zoxide
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')

# starship
import uuid

def starship_prompt():
    last_cmd = __xonsh__.history[-1] if __xonsh__.history else None
    status = last_cmd.rtn if last_cmd else 0
    # I believe this is equivalent to xonsh.jobs.get_next_job_number() for our purposes,
    # but we can't use that function because of https://gitter.im/xonsh/xonsh?at=60e8832d82dd9050f5e0c96a
    jobs = sum(1 for job in __xonsh__.all_jobs.values() if job['obj'] and job['obj'].poll() is None)
    duration = round((last_cmd.ts[1] - last_cmd.ts[0]) * 1000) if last_cmd else 0
    # The `| cat` is a workaround for https://github.com/xonsh/xonsh/issues/3786. See https://github.com/starship/starship/pull/2807#discussion_r667316323.
    return $(starship prompt --status=@(status) --jobs=@(jobs) --cmd-duration=@(duration) | cat)

def starship_rprompt():
    last_cmd = __xonsh__.history[-1] if __xonsh__.history else None
    status = last_cmd.rtn if last_cmd else 0
    # I believe this is equivalent to xonsh.jobs.get_next_job_number() for our purposes,
    # but we can't use that function because of https://gitter.im/xonsh/xonsh?at=60e8832d82dd9050f5e0c96a
    jobs = sum(1 for job in __xonsh__.all_jobs.values() if job['obj'] and job['obj'].poll() is None)
    duration = round((last_cmd.ts[1] - last_cmd.ts[0]) * 1000) if last_cmd else 0
    # The `| cat` is a workaround for https://github.com/xonsh/xonsh/issues/3786. See https://github.com/starship/starship/pull/2807#discussion_r667316323.
    return $(starship prompt --status=@(status) --jobs=@(jobs) --cmd-duration=@(duration) --right | cat)


$PROMPT = starship_prompt
$RIGHT_PROMPT = starship_rprompt
$STARSHIP_SHELL = "xonsh"
$STARSHIP_SESSION_KEY = uuid.uuid4().hex

# === Aliases ===
aliases['es'] = 'exa --git --icons'
aliases['ea'] = 'exa -a --git --icons'
aliases['el'] = 'exa -l --git --icons'
aliases['ela'] = 'exa -la --git --icons'
aliases['et'] = 'exa -lT --git --icons'
aliases['eta'] = 'exa -lTa --git --icons'
