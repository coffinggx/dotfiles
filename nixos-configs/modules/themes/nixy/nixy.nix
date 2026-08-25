{ config, lib, pkgs, ... }:

{
  options.theme = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    description = "Nixy theme colors";
  };

  # Register a `stylix` option so modules that check for `config.stylix` won't fail
  options.stylix = lib.mkOption {
    type = lib.types.attrs;
    description = "Stylix options (placeholder from Nixy theme)";
    default = {};
  };

  config = {
    stylix = lib.mkMerge [ (config.stylix or {}) {
      enable = true;

      # Base16-ish palette used by nixy (copied from anotherhadi/nixy)
      base16Scheme = {
        base00 = "0A0A0C"; # Default Background
        base01 = "110F12"; # Lighter Background
        base02 = "2D2A36";
        base03 = "514D63";
        base04 = "8E8AA0";
        base05 = "C2BED6";
        base06 = "D8D5EA";
        base07 = "EAE7F7";
        base08 = "E07080";
        base09 = "D49070";
        base0A = "C4B060";
        base0B = "80B880";
        base0C = "70B8C0";
        base0D = "9E97F8";
        base0E = "C090E8";
        base0F = "B3929B";
      };
    }];

    # Expose palette for modules that reference `config.lib.stylix.colors`
    lib = {
      stylix = {
        colors = (config.stylix.base16Scheme or {});
      };
    };
  };
}
