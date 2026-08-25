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
  # ─────────────────────────────────────────────
  # SWAY / SWAYFX
  # ─────────────────────────────────────────────

  programs.sway = {
    enable = true;

    # Use SwayFX instead of vanilla Sway.
    package = pkgs.swayfx;

    wrapperFeatures.gtk = true;
  };

  # ─────────────────────────────────────────────
  # DUNST
  # ─────────────────────────────────────────────

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

  # ─────────────────────────────────────────────
  # HOME MANAGER
  # ─────────────────────────────────────────────

  home-manager.users.coffinggx = {
    home.packages = with pkgs; [
      brightnessctl
      pamixer
      i3status-rust
      libnotify
      rofi
      ghostty
      pavucontrol
      grim
      slurp
    ];

    # ───────────────────────────────────────────
    # I3STATUS-RUST
    # ───────────────────────────────────────────

    # xdg.configFile."i3status-rust/config.toml".text = ''
    #   [[block]]
    #   block = "cpu"
    #   interval = 5
    #
    #   [[block]]
    #   block = "memory"
    #   format = "RAM: $mem_used_percents.eng(w:2)"
    #   interval = 10
    #
    #   [[block]]
    #   block = "sound"
    #   format = "VOL: $volume"
    #   step_width = 5
    #
    #   [[block]]
    #   block = "battery"
    #   format = "BAT: $percentage"
    #   interval = 10
    #
    #   [[block]]
    #   block = "time"
    #   format = "$timestamp.datetime(f:'%H:%M')"
    #   interval = 60
    # '';
    #
    # ───────────────────────────────────────────
    # SWAY CONFIG
    # ───────────────────────────────────────────

    xdg.configFile."sway/config".text = ''
      # ─────────────────────────────────────────
      # VARIABLES
      # ─────────────────────────────────────────

      set $mod ${mod}


      # ─────────────────────────────────────────
      # FONT
      # ─────────────────────────────────────────

      font "JetBrainsMono Nerd Font 8"


      # ─────────────────────────────────────────
      # SWAYFX EFFECTS
      # ─────────────────────────────────────────


      # Rounded corners
      corner_radius 8

      # Window shadows
      shadows enable
      shadow_blur_radius 8
      shadow_offset 0 2
      shadow_color #00000080

      # Blur
      blur disable


      # ─────────────────────────────────────────
      # BORDERS
      # ─────────────────────────────────────────

      default_border pixel 1
      default_floating_border pixel 1


      # ─────────────────────────────────────────
      # GAPS
      # ─────────────────────────────────────────

      gaps inner 0
      gaps outer 0


      # ─────────────────────────────────────────
      # TOUCHPAD
      # ─────────────────────────────────────────

      input type:touchpad {
        tap enabled
        pointer_accel 0.5
      }


      # ─────────────────────────────────────────
      # KEYBOARD
      # ─────────────────────────────────────────

      input type:keyboard {
        repeat_delay 200
        repeat_rate 35
      }


      # ─────────────────────────────────────────
      # APPLICATIONS
      # ─────────────────────────────────────────

      bindsym $mod+Return exec ${term}
      bindsym $mod+d exec ${menu}


      # ─────────────────────────────────────────
      # WINDOW MANAGEMENT
      # ─────────────────────────────────────────

      bindsym $mod+Shift+q kill

      bindsym $mod+Shift+r reload

      bindsym $mod+e layout stacking
      bindsym $mod+w layout tabbed

      bindsym $mod+j focus down
      bindsym $mod+k focus up
      bindsym $mod+h focus left
      bindsym $mod+l focus right

      bindsym $mod+Tab focus last

      bindsym $mod+Shift+h move left
      bindsym $mod+Shift+j move down
      bindsym $mod+Shift+k move up
      bindsym $mod+Shift+l move right

      bindsym $mod+f fullscreen toggle


      # ─────────────────────────────────────────
      # WORKSPACES
      # ─────────────────────────────────────────

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


      # ─────────────────────────────────────────
      # VOLUME
      # ─────────────────────────────────────────

      bindsym XF86AudioRaiseVolume exec ${volume-up}/bin/volume-up

      bindsym XF86AudioLowerVolume exec ${volume-down}/bin/volume-down

      bindsym XF86AudioMute exec ${volume-mute}/bin/volume-mute


      # ─────────────────────────────────────────
      # BRIGHTNESS
      # ─────────────────────────────────────────

      bindsym XF86MonBrightnessUp exec ${brightness-up}/bin/brightness-up

      bindsym XF86MonBrightnessDown exec ${brightness-down}/bin/brightness-down


      # ─────────────────────────────────────────
      # SCREENSHOTS
      # ─────────────────────────────────────────

      # Full screen
      bindsym Print exec grim ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png

      # Select region
      bindsym $mod+Print exec grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png


      # ─────────────────────────────────────────
      # DISPLAY
      # ─────────────────────────────────────────

      output eDP-1 mode 1920x1080@60Hz

      output eDP-1 bg /home/coffinggx/personal/wallpapers/ggs.png fill


      # ─────────────────────────────────────────
      # STATUS BAR
      # ─────────────────────────────────────────

      bar {
        position top

        status_command ${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config.toml

        workspace_buttons yes

        font "JetBrainsMono Nerd Font 8"

        colors {
          background "#181818"
          statusline "#e5e5e5"
          separator "#555555"

          focused_workspace "#181818" "#181818" "#ffffff"
          active_workspace "#181818" "#181818" "#aaaaaa"
          inactive_workspace "#181818" "#181818" "#777777"
          urgent_workspace "#181818" "#181818" "#ffffff"
        }
      }
    '';
  };
}
