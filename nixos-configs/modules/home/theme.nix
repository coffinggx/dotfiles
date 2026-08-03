{ config,pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 28;
  };

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;

    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };

    iconTheme = {
      name = "Tela-black";
      package = pkgs.tela-icon-theme;
    };
  };

  qt = {
    enable = true;

    platformTheme.name = "gtk3";

    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
