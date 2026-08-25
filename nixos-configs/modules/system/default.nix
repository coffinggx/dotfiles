{
  imports = [
    ./boot.nix
    ./desktop.nix
    ./docker.nix
    ./fonts.nix
    ./locale.nix
    ./networking.nix
    ./nvidia.nix
    ./packages.nix
    ./power.nix
    ./sound.nix
    ./users.nix
    ./input.nix
    ./game.nix


    # ../../wm/bspwm.nix
    ../../wm/i3.nix
    ../../wm/sway.nix
      ./hyprland-custom.nix
    ../themes/nixy/nixy.nix
  ];
}
