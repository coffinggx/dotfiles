{ ... }:

{
  programs.nixvim.plugins.harpoon = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require('harpoon'):list():add() end";
    }
  ];
}
