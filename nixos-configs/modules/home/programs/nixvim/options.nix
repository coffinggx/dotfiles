{ ... }:

{
  programs.nixvim.opts= {
    number = true;
    relativenumber = true;

    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;

    wrap = true;
    smartindent = true;

    inccommand = "split";

    splitright = true;
    splitbelow = true;

    ignorecase = true;
    smartcase = true;

    laststatus = 3;

    swapfile = false;
    backup = false;


    guicursor = "";

    scrolloff = 8;

    signcolumn = "yes";

    colorcolumn = "0";

    cmdheight = 0;

    termguicolors = true;

    completeopt = [
      "menuone"
      "noselect"
      "fuzzy"
      "nosort"
    ];
  };
  
}
