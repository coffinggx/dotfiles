{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    heroic

    wineWow64Packages.staging
    winetricks

    protonup-qt

    gamemode
    gamescope
    mangohud

    vulkan-tools
  ];

  programs.gamemode.enable = true;

  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    gamescopeSession.enable = true;
  };

}
