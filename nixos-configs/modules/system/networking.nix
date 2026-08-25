{ ... }:

{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  services.printing.enable = true;


  nix.settings.substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://mirror.sjtu.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
    "https://nix-community.cachix.org"
  ];
}
