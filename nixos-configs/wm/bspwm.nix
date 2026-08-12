{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.windowManager.bspwm.enable = true;
  environment.variables.LD_PRELOAD = "${pkgs.libX11}/lib/libX11.so";


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
