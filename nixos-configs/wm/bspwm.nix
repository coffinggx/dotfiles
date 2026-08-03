{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.windowManager.bspwm.enable = true;

  environment.systemPackages = with pkgs; [
    bspwm
    sxhkd
    ghostty
    kitty
    pavucontrol
    polybar
    feh
    picom
    alsa-utils
  ];
}
