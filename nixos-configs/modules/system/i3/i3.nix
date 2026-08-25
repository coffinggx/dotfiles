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
      pavucontrol
      feh
      picom
      alsa-utils
    ];

    programs.i3status-rust = {
      enable = true;

      bars.default = {
        blocks = [
          {
            block = "cpu";
            interval = 5;
          }

          {
            block = "memory";
            format = "RAM: $mem_used_percents.eng(w:2)";
            interval = 10;
          }

          {
            block = "sound";
            format = "VOL: $volume";
            step_width = 5;
          }

          {
            block = "battery";
            format = "BAT: $percentage";
            interval = 10;
          }

          {
            block = "time";
            format = "$timestamp.datetime(f:'%H:%M')";
            interval = 60;
          }
        ];

        icons = "none";
        theme = "plain";
      };
    };

    xsession.windowManager.i3 = {
      enable = true;

      config = {
        modifier = mod;
        terminal = term;
        menu = menu;

        fonts = {
          names = [ "JetBrains Mono" ];
          size = 10.0;
        };

        gaps = {
          inner = 0;
          outer = 0;
        };

        window = {
          border = 1;
          titlebar = false;
        };

        floating = {
          titlebar = false;
        };

        keybindings = {
          "${mod}+Return" = "exec ${term}";
          "${mod}+d" = "exec ${menu}";
          "${mod}+Shift+q" = "kill";
          "${mod}+Shift+r" = "reload";

          "${mod}+e" = "layout stacking";
          "${mod}+w" = "layout tabbed";

          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Tab" = "focus last";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "${mod}+f" = "fullscreen toggle";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "Print" = "exec shutter -s";
          "${mod}+Print" = "exec shutter -f";

          "XF86AudioRaiseVolume" = "exec ${volume-up}/bin/volume-up";
          "XF86AudioLowerVolume" = "exec ${volume-down}/bin/volume-down";
          "XF86AudioMute" = "exec ${volume-mute}/bin/volume-mute";

          "XF86MonBrightnessUp" = "exec ${brightness-up}/bin/brightness-up";
          "XF86MonBrightnessDown" = "exec ${brightness-down}/bin/brightness-down";
        };

        startup = [
          {
            command = "xrandr --output eDP --mode 1920x1080 --rate 60";
            notification = false;
          }

          {
            command = "xset r rate 200 35";
            notification = false;
          }

          {
            command = "feh --bg-fill /home/coffinggx/personal/wallpapers/ggs.png";
            notification = false;
          }
        ];

        bars = [
          {
            position = "top";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
            workspaceButtons = true;
            workspaceNumbers = false;

            colors = {
              background = "#111111";
              statusline = "#cccccc";

              focusedWorkspace = {
                border = "#222222";
                background = "#222222";
                text = "#ffffff";
              };

              activeWorkspace = {
                border = "#111111";
                background = "#111111";
                text = "#aaaaaa";
              };

              inactiveWorkspace = {
                border = "#111111";
                background = "#111111";
                text = "#666666";
              };

              urgentWorkspace = {
                border = "#222222";
                background = "#222222";
                text = "#ffffff";
              };
            };
          }
        ];
      };

      extraConfig = ''
        default_floating_border none
      '';
    };
  };
}
