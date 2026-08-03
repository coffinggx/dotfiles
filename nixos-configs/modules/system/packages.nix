{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lshw
    brightnessctl
    pamixer
    btop
    curl
    wget
    powertop
    psmisc
    power-profiles-daemon
  ];

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc
    ];
  };
}
