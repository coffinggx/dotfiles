{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.coffinggx = {
    isNormalUser = true;
    description = "coffinggx";
    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
      "render"
    ];
  };
}
