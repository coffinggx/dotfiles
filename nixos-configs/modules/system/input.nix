{ config, pkgs, ... }:

{
  services.xserver.libinput = {
    enable = true;

    touchpad = {
      accelSpeed = "0.6";
    };

  };
}
