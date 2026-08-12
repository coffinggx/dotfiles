{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      ff = "fastfetch";

      nrs = "sudo nixos-rebuild switch --flake ~/personal/dotfiles/nixos-configs";

      nixconf = "cd ~/personal/dotfiles/nixos-configs && nvim .";

      conf = "cd ~/personal/dotfiles && nvim .";

      ze = "zeditor";

      vim = "nvim";
      factorio = "steam-run ~/Facterio/Factorio/start";

      denv = "cd ~/personal/Programming && tmux new && nvim .";
    };

    functions.vf = ''
      set file (fd --type f | fzf)
      test -n "$file"; and nvim "$file"
    '';

    functions.menv = ''
      cd ~/personal/Programming/ML

      if not tmux has-session -t ml 2>/dev/null
          tmux new-session -d -s ml -n editor
          tmux new-window -t ml -n jupyter
      end

      tmux attach-session -t ml
    '';
  };
}
