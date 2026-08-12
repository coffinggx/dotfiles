{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    gnumake
    gdb
    cmake
    ninja
    python3Packages.pylatexenc
    ghostty
    clang
    fzf
    fd
    unrar
    gtk3
    steam-run

    neovim
    nodejs
    python3
    uv
    pkg-config
    spotdl

    zed-editor

    foot

    waybar
    rofi
    hyprpaper
    swayidle

    brave
    discord
    mission-center
    obsidian
    qbittorrent
    thunar

    rustc 
    cargo
    rust-analyzer

    mpc
    ncmpcpp

    unzip
    ripgrep
    tree
    pnpm
    shutter
    xclip
    zathura
    mpv
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser
  ];
}
