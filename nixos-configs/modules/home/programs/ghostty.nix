{
  pkgs,
  config,
  ...
}: let
  cursorShaders = pkgs.fetchFromGitHub {
    owner = "sahaj-b";
    repo = "ghostty-cursor-shaders";
    rev = "06d4e90fb5410e9c4d0b3131584060adddf89406";
    hash = "sha256-G/UIr1bKnxn1AcHl/4FL/jou6b7M2VeREslYVELxdmw=";
  };

  c = config.lib.stylix.colors;
in {
  home.sessionVariables = {
    TERMINAL = "ghostty";
    TERM = "ghostty";
  };

  programs.ghostty = {
    enable = true;
    installVimSyntax = true;

    settings = {
      # ── Window ─────────────────────────────────────────────
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;
      window-decoration = "server";
      window-theme = "system";

      gtk-single-instance = true;
      gtk-tabs-location = "bottom";
      confirm-close-surface = false;

      # ── Clipboard ─────────────────────────────────────────
      clipboard-read = "allow";
      clipboard-write = "allow";
      copy-on-select = "clipboard";

      # ── Appearance ────────────────────────────────────────
      theme = "Adventure";
      font-family = "JetBrains Mono";
      font-size = 14;

      # ── Cursor ────────────────────────────────────────────
      cursor-color = "#58ff58";

      # ── Shell ─────────────────────────────────────────────
      command = "fish";

      # ── Notifications ─────────────────────────────────────
      app-notifications = false;

      # ── Cursor shader ─────────────────────────────────────
      custom-shader = "${cursorShaders}/cursor_warp.glsl";
      custom-shader-animation = "always";

      # ── Keybindings ───────────────────────────────────────
      keybind = [
        "shift+ctrl+tab=new_tab"
        "ctrl+s=text:\\x01s"
        "ctrl+b=text:\\x01z"
      ];
    };
  };
}
