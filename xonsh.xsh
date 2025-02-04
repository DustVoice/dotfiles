# === Init ===

# > Xontrib
xontrib load coreutils
# < Xontrib

# > General
$FORCE_POSIX_PATHS = True
$UPDATE_OS_ENVIRON = True
# < General

# > Interactive Prompt
$VI_MODE = True
$XONSH_AUTOPAIR = True
$XONSH_HISTORY_MATCH_ANYWHERE = True
$XONSH_SUPPRESS_WELCOME = True
# < Interactive Prompt

# > Interpreter Behavior
$DOTGLOB = True
# < Interpreter Behavior

# > Tab-completion behavior
$CMD_COMPLETIONS_SHOW_DESC = True
$COMPLETIONS_CONFIRM = True
$COMPLETIONS_DISPLAY = 'single'
$COMPLETION_IN_THREAD = True
$UPDATE_COMPLETIONS_ON_KEYPRESS = False
# < Tab-completion behavior

# === Tools ===

# > carapace-bin
exec($(carapace _carapace))
# < carapace-bin

# > zoxide
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')
# < zoxide

# > starship
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
# < starship

# === Default Aliases ===

# > eza
aliases['es'] = ['eza', '--git', '--icons=auto']
aliases['el'] = ['eza', '-lh', '--git', '--icons=auto']
aliases['et'] = ['eza', '-lTh', '--git', '--icons=auto']
aliases['esa'] = ['eza', '-a', '--git', '--icons=auto']
aliases['ela'] = ['eza', '-lah', '--git', '--icons auto']
aliases['eta'] = ['eza', '-lTah', '--git', '--icons auto']
# < eza

# === Custom Section ===

conf_dir = $XONSH_CONFIG_DIR

# > User rc.xonsh
if pf'{conf_dir}/user.xsh'.exists():
    source $XONSH_CONFIG_DIR/user.xsh
# <

# > Aliases
if pf'{conf_dir}/alias.xsh'.exists():
    source $XONSH_CONFIG_DIR/alias.xsh
# < Aliases

# > Environment Variables
if pf'{conf_dir}/env.xsh'.exists():
    source $XONSH_CONFIG_DIR/env.xsh
# < Environment Variables

# > .xonshrc (e.g. for conda init)
if p'~/.xonshrc'.exists():
    source ~/.xonshrc
# > .xonshrc
