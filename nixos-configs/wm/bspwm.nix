{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.windowManager.bspwm.enable = true;


  environment.systemPackages = with pkgs; [
    bspwm
    sxhkd
    polybar
    
  ];
}
