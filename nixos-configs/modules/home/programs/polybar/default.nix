{ config, pkgs, ... }:

{
  programs.polybar.enable = true;
  home.file.".config/polybar/config.ini".text = ''
; Polybar config
[colors]
bg=#1A1B26
fg=#F1F1F1
red=#f7768e
green=#9ece6a
cyan=#7dcfff
blue=#7aa2f7
grey=#44475a

[bar/main]
width=100%
height=30
background=\${colors.bg}
foreground=\${colors.fg}
radius=6
padding-left=1
padding-right=1
font-0=JetBrainsMono Nerd Font:size=11;2
modules-left=bspwm
modules-center=xwindow
modules-right=backlight pulseaudio battery date tray
separator=│
separator-foreground=#44475a
wm-restack=bspwm
enable-ipc=true

[module/bspwm]
type=internal/bspwm
pin-workspaces=true
label-focused=%name%
label-focused-foreground=\${colors.red}
label-focused-underline=\${colors.red}
label-focused-padding=1
label-occupied=%name%
label-occupied-foreground=#7dcfff
label-occupied-padding=1
label-empty=%name%
label-empty-foreground=#666
label-empty-padding=1

[module/xwindow]
type=internal/xwindow
label=%title:0:50:...%

[module/backlight]
type=internal/backlight
card=amdgpu_bl2
format=󰃞 <label>
label=%percentage%%

[module/pulseaudio]
type=custom/script
exec=pamixer --get-volume-human
interval=2
format=󰕾 <label>
label=%output%

[module/battery]
type=internal/battery
battery=BAT0
adapter=ACAD
full-at=98
label-charging= %percentage%%
label-discharging= %percentage%%
label-full= 100%%

[module/date]
type=internal/date
interval=5
time=%H:%M
date=%a %d %b
label=%date% %time%

[module/tray]
type=internal/tray
tray-spacing=6

[settings]
screenchange-reload=true
enable-ipc=true
'';

  home.file.".config/polybar/launch.sh".text = ''
#!/usr/bin/env sh

killall -q polybar

while pgrep -u "$UID" polybar >/dev/null; do
    sleep 1
done

polybar main &
'';
}
