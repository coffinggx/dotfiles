require("vim._core.ui2").enable({})
local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
require("vim-options")
require("keybinds")
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_hl(0, "Keyword", { italic = true })
vim.keymap.set("n", "<C-n>", ":Ex<CR>")
require("lazy").setup("plugins")
