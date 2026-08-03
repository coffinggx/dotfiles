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

    ../../wm/bspwm.nix
  ];
}
