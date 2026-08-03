{ ... }:

{
  programs.nixvim.plugins.lsp.keymaps = {
    silent = true;

    diagnostic = {
      "<leader>k" = "goto_prev";
      "<leader>j" = "goto_next";
    };

    lspBuf = {
      gd = "definition";
      K = "hover";
    };
  };
}
