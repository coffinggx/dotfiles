{ pkgs-unstable,
  pkgs,
  config,
  lib,
  ...
}: let
  border-size = config.theme.border-size;
  gaps-in = config.theme.gaps-in;
  gaps-out = config.theme.gaps-out;
  active-opacity = config.theme.active-opacity;
  inactive-opacity = config.theme.inactive-opacity;
  rounding = config.theme.rounding;
  blur = config.theme.blur;
  keyboardLayout = config.var.keyboardLayout;
  background = "rgba(" + config.lib.stylix.colors.base00 + "EE)";
in {
  imports = [
    # This file is a reference copy from anotherhadi/nixy. It is provided
    # for guidance on how the original project structured Hyprland settings.
    # Do not enable this file directly unless you review and adapt it.
    ./animations.nix
    ./bindings.nix
    ./polkitagent.nix
    ./hyprpaper.nix
  ];

  # The original content defines various packages and `wayland.windowManager.hyprland` settings.
  # Keep this file as a reference for migrating styling into your declarative modules.
}
