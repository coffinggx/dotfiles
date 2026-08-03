{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    gcc
    gnumake
    gdb
    nodejs
    python3
    uv
    pkg-config

    clang-tools
    pyright
    gopls
    rust-analyzer

    ddev
    mkcert

    zed-editor
    vscode

    foot
    fastfetch

    waybar
    rofi
    hyprpaper
    swayidle
    flameshot

    brave
    librewolf
    discord
    spotify
    telegram-desktop
    libreoffice
    mission-center
    obsidian
    qbittorrent
    postman
    davinci-resolve

    unzip

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser
  ];
}
