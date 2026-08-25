{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    grip

    typst
    tinymist

    proton-vpn
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

    zed-editor

    brave
    discord
    mission-center
    obsidian
    qbittorrent
    thunar

    rustup

    unzip
    ripgrep
    tree
    pnpm
    xclip
    zathura
    mpv
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser
  ];
}
