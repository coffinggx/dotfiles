{ ... }:

{
  imports = [
    ./options.nix
    ./globals.nix
    ./autocmds.nix
    ./extra-config.nix

    ./plugins
    ./lsp
  ];

  programs.nixvim = {
    enable = false;
  };
}
