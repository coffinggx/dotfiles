{
  imports = [
    ./hardware-configuration.nix
    ./modules/system
  ];
  environment.etc."wayland-sessions/sway-unsupported.desktop".text = ''
  [Desktop Entry]
  Name=Sway (Unsupported GPU)
  Comment=Sway with unsupported GPU flag
  Exec=sway --unsupported-gpu
  Type=Application
  DesktopNames=sway
'';
}
