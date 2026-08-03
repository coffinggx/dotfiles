-- vim.g.python_recommended_style = 0
--
vim.cmd("filetype plugin indent on")
-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set softtabstop=4")
-- vim.cmd("set shiftwidth=4")
-- vim.cmd("set relativenumber")
-- vim.cmd("set autoindent")
-- vim.cmd("set number")
-- vim.cmd("set guicursor=n-v-c-i:block")
--
-- vim.g.mapleader = " "

-- ZR to restart nvim
vim.g.netrw_banner = 0

vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 spaces indentation
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- make a tab 4 spaces
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.smartindent = true

-- make search replace visual
vim.opt.inccommand = "split"

-- split docs below and right instead of top
vim.opt.splitright = true
vim.opt.splitbelow = true

-- case sensi
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- single status line for full screen
vim.opt.laststatus = 3

-- undotree even after vim is quited
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir =  vim.fn.stdpath("data") .. "/undodir"

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
-- block cusor for all mode
vim.opt.guicursor=""

vim.opt.scrolloff = 8
-- space left to line numbers
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"
-- hide cmd for default
vim.o.cmdheight = 0

vim.opt.termguicolors = true

-- highlight when yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function()
        vim.hl.on_yank()
    end,
})
-- completions easier
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")
