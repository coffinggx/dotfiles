{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      ff = "fastfetch";

      nrs = "sudo nixos-rebuild switch --flake ~/personal/dotfiles/nixos-configs";

      nixconf = "nvim ~/personal/dotfiles/nixos-configs/configuration.nix";

      conf = "nvim ~/personal/dotfiles/nixos-configs";

      ze = "zeditor";

      vim = "nvim";

      penv = "cd ~/personal/Programming && tmux new && nvim .";
    };
  };
}
