{
  programs.tmux = {
    enable = true;

    # ── Native Home Manager options ─────────────────────────

    prefix = "C-a";

    mouse = true;

    historyLimit = 10000;

    baseIndex = 1;

    resizeAmount = 5;

    keyMode = "vi";

    # ── Raw tmux options not exposed by Home Manager ────────
    extraConfig = ''
      # Send prefix when Ctrl-a is pressed twice
      bind C-a send-prefix

      # Disable bell
      set-option -g bell-action none

      # ── Splits ────────────────────────────────────────────
      unbind '"'
      unbind %

      bind | split-window -h
      bind - split-window -v

      # ── Pane Navigation ───────────────────────────────────
      bind -r h select-pane -L
      bind -r j select-pane -D
      bind -r k select-pane -U
      bind -r l select-pane -R

      # ── Pane Resizing ─────────────────────────────────────
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # ── Status Bar ────────────────────────────────────────
      set -g status on
      set -g status-interval 5
      set -g status-justify centre

      set -g status-bg black
      set -g status-fg white

      set -g status-left-length 40
      set -g status-right-length 150

      set -g status-left '#[fg=green]#S #[fg=cyan]| #[fg=yellow]%Y-%m-%d'
      set -g status-right '#[fg=cyan]%H:%M #[fg=white]| #[fg=green]#(whoami)@#H'

      # ── Window Styling ────────────────────────────────────
      setw -g window-status-current-style 'fg=black,bg=yellow'
      setw -g window-status-current-format ' #I:#W '
      setw -g window-status-format ' #I:#W '

      # ── Reload ────────────────────────────────────────────
      bind r source-file ~/.tmux.conf \; display-message "Config reloaded!"
    '';
  };
}
