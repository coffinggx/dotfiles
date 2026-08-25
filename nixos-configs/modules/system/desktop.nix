{
  services.xserver.enable = true;

  services.displayManager.ly.enable = true;

  programs.hyprland.enable = true;

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
}
