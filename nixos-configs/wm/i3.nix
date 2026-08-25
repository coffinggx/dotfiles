{ pkgs, ... }:

let
  term = "ghostty";
  menu = "rofi -show drun";
  mod = "Mod4";

  brightness-up = pkgs.writeShellScriptBin "brightness-up" ''
    brightnessctl set +10%
    notify-send -r 9992 "Brightness" "$(brightnessctl -m | cut -d, -f4)"
  '';

  brightness-down = pkgs.writeShellScriptBin "brightness-down" ''
    brightnessctl set 10%-
    notify-send -r 9992 "Brightness" "$(brightnessctl -m | cut -d, -f4)"
  '';

  volume-up = pkgs.writeShellScriptBin "volume-up" ''
    pamixer -i 5
    notify-send -r 9991 "Volume" "$(pamixer --get-volume)%"
  '';

  volume-down = pkgs.writeShellScriptBin "volume-down" ''
    pamixer -d 5
    notify-send -r 9991 "Volume" "$(pamixer --get-volume)%"
  '';

  volume-mute = pkgs.writeShellScriptBin "volume-mute" ''
    pamixer -t

    if pamixer --get-mute; then
      notify-send -r 9991 "Volume" "Muted"
    else
      notify-send -r 9991 "Volume" "$(pamixer --get-volume)%"
    fi
  '';
in
{
  services.xserver.enable = true;

  services.xserver.windowManager.i3.enable = true;

  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 80;
        offset = "16x16";
        origin = "top-right";
        corner_radius = 10;
        frame_width = 0;
        padding = 12;
        horizontal_padding = 12;
        text_icon_padding = 8;
        font = "DejaVu Sans 9";
        markup = "full";
        format = "<b>%s</b>\\n%b";
        timeout = 3;
        notification_limit = 3;
        stack_duplicates = true;
      };

      urgency_normal = {
        background = "#181818";
        foreground = "#e5e5e5";
        timeout = 3;
      };

      urgency_low = {
        background = "#181818";
        foreground = "#999999";
        timeout = 3;
      };

      urgency_critical = {
        background = "#181818";
        foreground = "#ffffff";
        timeout = 5;
      };
    };
  };

  home-manager.users.coffinggx = {
    home.packages = with pkgs; [
      brightnessctl
      pamixer
      i3status-rust
      libnotify
      shutter
      rofi
      ghostty
      kitty
      pavucontrol
      feh
      picom
      alsa-utils
    ];

    xdg.configFile."i3status-rust/config.toml".text = ''
      [[block]]
      block = "cpu"
      interval = 5

      [[block]]
      block = "memory"
      format = "RAM: $mem_used_percents.eng(w:2)"
      interval = 10

      [[block]]
      block = "sound"
      format = "VOL: $volume"
      step_width = 5

      [[block]]
      block = "battery"
      format = "BAT: $percentage"
      interval = 10

      [[block]]
      block = "time"
      format = "$timestamp.datetime(f:'%H:%M')"
      interval = 60
    '';

    xdg.configFile."i3/config".text = ''
      set $mod ${mod}

      default_border pixel 1
      default_floating_border none

      gaps inner 0
      gaps outer 0

      bindsym $mod+Return exec ${term}
      bindsym $mod+d exec ${menu}
      bindsym $mod+Shift+q kill
      bindsym $mod+Shift+r reload

      bindsym $mod+e layout stacking
      bindsym $mod+w layout tabbed

      bindsym $mod+j focus down
      bindsym $mod+k focus up
      bindsym $mod+l focus right
      bindsym $mod+Tab focus last

      bindsym $mod+Shift+h move left
      bindsym $mod+Shift+j move down
      bindsym $mod+Shift+k move up
      bindsym $mod+Shift+l move right

      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      set $ws6 "6"
      set $ws7 "7"
      set $ws8 "8"
      set $ws9 "9"
      set $ws10 "10"

      bindsym $mod+f fullscreen toggle

      bindsym $mod+1 workspace $ws1
      bindsym $mod+2 workspace $ws2
      bindsym $mod+3 workspace $ws3
      bindsym $mod+4 workspace $ws4
      bindsym $mod+5 workspace $ws5
      bindsym $mod+6 workspace $ws6
      bindsym $mod+7 workspace $ws7
      bindsym $mod+8 workspace $ws8
      bindsym $mod+9 workspace $ws9
      bindsym $mod+0 workspace $ws10

      bindsym $mod+Shift+1 move container to workspace $ws1
      bindsym $mod+Shift+2 move container to workspace $ws2
      bindsym $mod+Shift+3 move container to workspace $ws3
      bindsym $mod+Shift+4 move container to workspace $ws4
      bindsym $mod+Shift+5 move container to workspace $ws5
      bindsym $mod+Shift+6 move container to workspace $ws6
      bindsym $mod+Shift+7 move container to workspace $ws7
      bindsym $mod+Shift+8 move container to workspace $ws8
      bindsym $mod+Shift+9 move container to workspace $ws9
      bindsym $mod+Shift+0 move container to workspace $ws10

      bindsym Print exec shutter -s
      bindsym $mod+Print exec shutter -f

      bindsym XF86AudioRaiseVolume exec ${volume-up}/bin/volume-up
      bindsym XF86AudioLowerVolume exec ${volume-down}/bin/volume-down
      bindsym XF86AudioMute exec ${volume-mute}/bin/volume-mute

      bindsym XF86MonBrightnessUp exec ${brightness-up}/bin/brightness-up
      bindsym XF86MonBrightnessDown exec ${brightness-down}/bin/brightness-down

      exec --no-startup-id xrandr --output eDP --mode 1920x1080 --rate 60
      exec --no-startup-id xset r rate 200 35
      exec --no-startup-id feh --bg-fill /home/coffinggx/personal/wallpapers/ggs.png

      bar {
        position top
        status_command ${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config.toml
        workspace_buttons yes
        strip_workspace_numbers yes

        colors {
          background #111111
          statusline #cccccc
          focused_workspace #222222 #222222 #ffffff
          active_workspace #111111 #111111 #aaaaaa
          inactive_workspace #111111 #111111 #666666
          urgent_workspace #222222 #222222 #ffffff
        }
      }
    '';
  };
}
