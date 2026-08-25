{ config, pkgs, lib, ... }:

lib.mkIf (lib.hasAttr "wayland" config) {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    xwayland.enable = true;
    systemd.enable = false;

    settings = {
      # variables from original config
      "$mainMod" = "SUPER";
      "$terminal" = "foot";
      "$menu" = "rofi -show drun";

      monitor = [ "eDP-1,1920x1080@60,0x0,1.0" ];

      exec-once = [
        "swayidle -w \u002F\u005C\u005C timeout 400 \"hyprctl dispatch dpms off\" \u005C\u005C resume \"hyprctl dispatch dpms on\" \u005C\u005C before-sleep \"loginctl lock-session\""
        "waybar"
        "swaync"
        "awww-daemon & sleep 0.1 & awww ~/personal/wallpapers/ggs.jpg"
      ];

      env = [
        "LIBVA_DRIVER_NAME,radeonsi"
        "VDPAU_DRIVER,radeonsi"
        "GTK_ICON_THEME,Adwaita"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 1;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        rounding_power = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        dim_inactive = false;
        blur = { enabled = false; };
      };

      animations = { enabled = false; };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0.4;
        repeat_rate = 50;
        repeat_delay = 200;
        touchpad = { natural_scroll = false; };
      };

      cursor = { inactive_timeout = 30; no_hardware_cursors = false; };

      # Binds converted to hyprland settings strings (keeps variables like $mainMod)
      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, E, exec, pgrep waybar >/dev/null && pkill waybar || waybar"
        "$mainMod, D, exec, $menu"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, V, togglefloating"
        "$mainMod SHIFT, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod SHIFT, R, exec, hyprctl reload"

        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, L, movewindow, r"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, N, exec, swaync-client -t"
        "$mainMod SHIFT, N, exec, swaync-client -d"
        "$mainMod CTRL, N, exec, swaync-client -C"
      ];
    };
  };
}
