{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 3;
        };
      };

      display = {
        separator = " ─ ";
      };

      modules = [
        "title"
        "separator"

        {
          type = "os";
          key = "󱄅 OS";
        }

        {
          type = "host";
          key = "󰌢 Host";
        }

        {
          type = "kernel";
          key = "󰒋 Kernel";
        }

        {
          type = "uptime";
          key = "󰅐 Uptime";
        }

        "break"

        {
          type = "shell";
          key = "󰆍 Shell";
        }

        {
          type = "terminal";
          key = "󰆍 Terminal";
        }

        {
          type = "wm";
          key = " WM";
        }

        {
          type = "theme";
          key = "󰏘 Theme";
        }

        "break"

        {
          type = "cpu";
          key = "󰻠 CPU";
        }

        {
          type = "gpu";
          key = "󰢮 GPU";
        }

        {
          type = "memory";
          key = "󰍛 Memory";
        }

        {
          type = "disk";
          key = "󰋊 Disk";
          folders = [ "/" ];
        }

        "break"

        {
          type = "packages";
          key = "󰏖 Packages";
        }

        {
          type = "locale";
          key = "󰗊 Locale";
        }

        {
          type = "datetime";
          key = "󰥔 Time";
        }

        
      ];
    };
  };
}
