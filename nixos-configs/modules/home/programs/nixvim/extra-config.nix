{ ... }:

{
  programs.nixvim.extraConfigLua = ''
    vim.cmd("filetype plugin indent on")

    vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

    vim.opt.isfname:append("@-@")

    vim.opt.shortmess:append("c")
  '';
}
