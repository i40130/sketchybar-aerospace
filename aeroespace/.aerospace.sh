# Place a copy of this config to ~/.aerospace.toml
# After that, you can edit ~/.aerospace.toml to your liking

# You can use it to add commands that run after login to macOS user session.
# 'start-at-login' needs to be 'true' for 'after-login-command' to work
# Available commands: https://nikitabobko.github.io/AeroSpace/commands
after-login-command = []

# You can use it to add commands that run after AeroSpace startup.
# 'after-startup-command' is run after 'after-login-command'
# Available commands : https://nikitabobko.github.io/AeroSpace/commands
# You can use it to add commands that run after AeroSpace startup.
# 'after-startup-command' is run after 'after-login-command'
# Available commands : https://nikitabobko.github.io/AeroSpace/commands

# You can use it to add commands that run after AeroSpace startup.
# 'after-startup-command' is run after 'after-login-command'
# Available commands : https://nikitabobko.github.io/AeroSpace/commands
after-startup-command = [
    # Install JankyBorders first, it has a built-in detection of already running process,
    # so it won't be run twice on AeroSpace restart
    'exec-and-forget borders active_color=0xffffffff inactive_color=0xffa1a1a1 width=5.0',
    'exec-and-forget /bin/bash -c "sleep 2 && /opt/homebrew/bin/sketchybar"'
]

exec-on-workspace-change = [
    '/bin/bash',
    '-c',
    '/opt/homebrew/opt/sketchybar/bin/sketchybar --trigger aerospace_workspace_change AEROSPACE_FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE AEROSPACE_PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE',
]

# Start AeroSpace at login
start-at-login = true

# Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
enable-normalization-flatten-containers = true
enable-normalization-opposite-orientation-for-nested-containers = true

# See: https://nikitabobko.github.io/AeroSpace/guide#layouts
# The 'accordion-padding' specifies the size of accordion padding
# You can set 0 to disable the padding feature
accordion-padding = 30

# Possible values: tiles|accordion
default-root-container-layout = 'tiles'

# Possible values: horizontal|vertical|auto
# 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,
#               tall monitor (anything higher than wide) gets vertical orientation
default-root-container-orientation = 'auto'

# Mouse follows focus when focused monitor changes
# Drop it from your config, if you don't like this behavior
# See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
# See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
# Fallback value (if you omit the key): on-focused-monitor-changed = []
on-focused-monitor-changed = ['move-mouse monitor-lazy-center']

# You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
# Useful if you don't use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key
# Also see: https://nikitabobko.github.io/AeroSpace/goodies#disable-hide-app
automatically-unhide-macos-hidden-apps = false

# Possible values: (qwerty|dvorak)
# See https://nikitabobko.github.io/AeroSpace/guide#key-mapping
[key-mapping]
preset = 'qwerty'

# Gaps between windows (inner-*) and between monitor edges (outer-*).
# Possible values:
# - Constant:     gaps.outer.top = 8
# - Per monitor:  gaps.outer.top = [{ monitor.main = 16 }, { monitor."some-pattern" = 32 }, 24]
#                 In this example, 24 is a default value when there is no match.
#                 Monitor pattern is the same as for 'workspace-to-monitor-force-assignment'.
#                 See: https://nikitabobko.github.io/AeroSpace/guide#assign-workspaces-to-monitors
[gaps]
inner.horizontal = 10
inner.vertical =   10
outer.left =       10
outer.bottom =     10
outer.top =        40
outer.right =      10

[workspace-to-monitor-force-assignment]
C = 2
D = 2
M = 2
U = 2
8 = 2
9 = 2

# 'main' binding mode declaration
# See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
# 'main' binding mode must be always presented
# Fallback value (if you omit the key): mode.main.binding = {}
[mode.main.binding]

# All possible keys:
# - Letters.        a, b, c, ..., z
# - Numbers.        0, 1, 2, ..., 9
# - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9
# - F-keys.         f1, f2, ..., f20
# - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,
#                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab
# - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,
#                   keypadMinus, keypadMultiply, keypadPlus
# - Arrows.         left, down, up, right

# All possible modifiers: cmd, alt, ctrl, shift

# All possible commands: https://nikitabobko.github.io/AeroSpace/commands

# See: https://nikitabobko.github.io/AeroSpace/commands#exec-and-forget
# You can uncomment the following lines to open up terminal with alt + enter shortcut (like in i3)
# alt-enter = '''exec-and-forget osascript -e '
# tell application "Terminal"
#     do script
#     activate
# end tell'
# '''

# See: https://nikitabobko.github.io/AeroSpace/commands#layout
alt-period = 'layout tiles horizontal vertical'
alt-comma = 'layout accordion horizontal vertical'
alt-f = 'fullscreen'
alt-shift-f = 'close-all-windows-but-current'
alt-up = 'workspace prev --wrap-around'
alt-down = 'workspace next --wrap-around'


ctrl-shift-left = 'join-with left'
ctrl-shift-down = 'join-with down'
ctrl-shift-up = 'join-with up'
ctrl-shift-right = 'join-with right'



# See: https://nikitabobko.github.io/AeroSpace/commands#focus
alt-ctrl-left = 'focus left'
alt-ctrl-down = 'focus down'
alt-ctrl-up = 'focus up'
alt-ctrl-right = 'focus right'

# See: https://nikitabobko.github.io/AeroSpace/commands#move
alt-ctrl-shift-left = 'move left'
alt-ctrl-shift-down = 'move down'
alt-ctrl-shift-up = 'move up'
alt-ctrl-shift-right = 'move right'


# See: https://nikitabobko.github.io/AeroSpace/commands#workspace
alt-ctrl-1 = 'workspace 1'
alt-ctrl-2 = 'workspace 2'
#alt-ctrl-3 = 'workspace 3'
#alt-ctrl-4 = 'workspace 4'
#alt-ctrl-5 = 'workspace 5'
#alt-ctrl-6 = 'workspace 6'
#alt-ctrl-7 = 'workspace 7'
alt-ctrl-8 = 'workspace 8'
alt-ctrl-9 = 'workspace 9'
#alt-ctrl-a = 'workspace A' # In your config, you can drop workspace bindings that you don't need
alt-ctrl-b = 'workspace B'
alt-ctrl-c = 'workspace C'
alt-ctrl-d = 'workspace D'
#alt-ctrl-e = 'workspace E'
alt-ctrl-f = 'workspace F'
#alt-ctrl-g = 'workspace G'
alt-ctrl-i = 'workspace I'
alt-ctrl-m = 'workspace M'
#alt-ctrl-n = 'workspace N'
#alt-ctrl-o = 'workspace O'
#alt-ctrl-p = 'workspace P'
#alt-ctrl-q = 'workspace Q'
#alt-ctrl-r = 'workspace R'
#alt-ctrl-s = 'workspace S'
alt-ctrl-t = 'workspace T'
alt-ctrl-u = 'workspace U'
#alt-ctrl-v = 'workspace V'
alt-ctrl-w = 'workspace W'
#alt-ctrl-x = 'workspace X'
#alt-ctrl-y = 'workspace Y'
#alt-ctrl-z = 'workspace Z'

# See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
alt-ctrl-shift-1 = 'move-node-to-workspace 1'
alt-ctrl-shift-2 = 'move-node-to-workspace 2'
#alt-ctrl-shift-3 = 'move-node-to-workspace 3'
#alt-ctrl-shift-4 = 'move-node-to-workspace 4'
#alt-ctrl-shift-5 = 'move-node-to-workspace 5'
#alt-ctrl-shift-6 = 'move-node-to-workspace 6'
#alt-ctrl-shift-7 = 'move-node-to-workspace 7'
alt-ctrl-shift-8 = 'move-node-to-workspace 8'
alt-ctrl-shift-9 = 'move-node-to-workspace 9'
#alt-ctrl-shift-a = 'move-node-to-workspace A'
alt-ctrl-shift-b = 'move-node-to-workspace B'
alt-ctrl-shift-c = 'move-node-to-workspace C'
alt-ctrl-shift-d = 'move-node-to-workspace D'
#alt-ctrl-shift-e = 'move-node-to-workspace E'
alt-ctrl-shift-f = 'move-node-to-workspace F'
#alt-ctrl-shift-g = 'move-node-to-workspace G'
alt-ctrl-shift-i = 'move-node-to-workspace I'
alt-ctrl-shift-m = 'move-node-to-workspace M'
#alt-ctrl-shift-n = 'move-node-to-workspace N'
#alt-ctrl-shift-o = 'move-node-to-workspace O'
#alt-ctrl-shift-p = 'move-node-to-workspace P'
#alt-ctrl-shift-q = 'move-node-to-workspace Q'
#alt-ctrl-shift-r = 'move-node-to-workspace R'
#alt-ctrl-shift-s = 'move-node-to-workspace S'
alt-ctrl-shift-t = 'move-node-to-workspace T'
alt-ctrl-shift-u = 'move-node-to-workspace U'
#alt-ctrl-shift-v = 'move-node-to-workspace V'
alt-ctrl-shift-w = 'move-node-to-workspace W'
#alt-ctrl-shift-x = 'move-node-to-workspace X'
#alt-ctrl-shift-y = 'move-node-to-workspace Y'
#alt-ctrl-shift-z = 'move-node-to-workspace Z'

# See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
alt-tab = 'workspace-back-and-forth'
# See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'



# See: https://nikitabobko.github.io/AeroSpace/commands#mode
alt-r = 'mode resize'

[mode.resize.binding]
left = 'resize width -50' 
up = 'resize height +50'
down = 'resize height -50'
right = 'resize width +50'

alt-shift-c = 'reload-config'
alt-0 = 'balance-sizes'

r = ['flatten-workspace-tree', 'mode main'] # reset layout
f = ['layout floating tiling', 'mode main'] # Toggle between floating and tiling layout
backspace = ['close-all-windows-but-current', 'mode main']

enter = ['reload-config', 'mode main']
esc = ['reload-config', 'mode main']



# See: https://nikitabobko.github.io/AeroSpace/commands#mode
alt-s = 'mode service'

[mode.service.binding]

esc = ['reload-config', 'mode main']

# sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2
#s = ['layout sticky tiling', 'mode main']

alt-shift-left = ['join-with left', 'mode main']
alt-shift-down = ['join-with down', 'mode main']
alt-shift-up = ['join-with up', 'mode main']
alt-shift-right = ['join-with right', 'mode main']

down = 'volume down'
up = 'volume up'
shift-down = ['volume set 0', 'mode main']



# this needs to be on the bottom of the file
# run 'aerospace list-apps'  to list to apps IDs

[[on-window-detected]]
if.app-id = 'com.runningwithcrayons.Alfred-Preferences'
run = 'layout floating'

[[on-window-detected]]
if.app-id = 'com.apple.findmy'
run = 'layout floating'

[[on-window-detected]]
if.app-id = 'com.apple.Passwords'
run = 'layout floating'

[[on-window-detected]]
if.app-id = 'com.macpaw.CleanMyMac-setapp'
run = 'layout floating'

[[on-window-detected]]
if.app-id = 'com.apple.QuickTimePlayerX'
run = 'layout floating'


# workspace B apps : browsers (safari, arc)
[[on-window-detected]]
if.app-id = 'com.apple.Safari'
run = 'move-node-to-workspace B'

# workspace C apps : communications (discord, messages, teams)
[[on-window-detected]]
if.app-id = 'com.hnc.Discord'
run = 'move-node-to-workspace C'

[[on-window-detected]]
if.app-id = 'com.apple.MobileSMS'
run = 'move-node-to-workspace C'

[[on-window-detected]]
if.app-id = 'com.microsoft.teams2'
run = 'move-node-to-workspace C'

# workspace D apps : development (IntelliJ, Datagrip, Pycharm, Webstrom)
[[on-window-detected]]
if.app-id = 'com.jetbrains.intellij'
run = 'move-node-to-workspace D'

[[on-window-detected]]
if.app-id = 'com.jetbrains.datagrip'
run = 'move-node-to-workspace D'

[[on-window-detected]]
if.app-id = 'com.jetbrains.pycharm'
run = 'move-node-to-workspace D'

[[on-window-detected]]
if.app-id = 'com.jetbrains.WebStorm'
run = 'move-node-to-workspace D'


# workspace F apps : Finder
[[on-window-detected]]
if.app-id = 'com.apple.finder'
run = 'move-node-to-workspace F'

# workspace I apps : IAs (perplexity, chatgpt)
[[on-window-detected]]
if.app-id = 'com.openai.chat'
run = 'move-node-to-workspace I'

[[on-window-detected]]
if.app-id = 'ai.perplexity.mac'
run = 'move-node-to-workspace I'

# workspace M apps : Mail
[[on-window-detected]]
if.app-id = 'com.apple.mail'
run = 'move-node-to-workspace M'

# workspace T apps : Terminals (warp, iTerm2)
[[on-window-detected]]
if.app-id = 'dev.warp.Warp-Stable'
run = 'move-node-to-workspace T'

[[on-window-detected]]
if.app-id = 'com.googlecode.iterm2'
run = 'move-node-to-workspace T'

# workspace U apps : Unir (calendar, reminders)
[[on-window-detected]]
if.app-id = 'com.apple.iCal'
run = ['layout tiling', 'move-node-to-workspace U']

[[on-window-detected]]
if.app-id = 'com.apple.reminders'
run = ['layout tiling', 'move-node-to-workspace U']


   

