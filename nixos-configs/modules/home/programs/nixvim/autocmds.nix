{ ... }:

{
  programs.nixvim.autoCmd = [
    {
      event = [ "TextYankPost" ];

      desc = "Highlight when yanking text";

      callback = {
        __raw = ''
          function()
            vim.hl.on_yank()
          end
        '';
      };
    }
  ];
}
