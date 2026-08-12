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
       gtk3
       atk
       pango
       cairo
       glib
       gdk-pixbuf
       harfbuzz
       lz4
       zstd
       xz
       zlib
    ];
  };
}
