vim.keymap.set("n", "l", "<CR>", { remap = true, buffer = true }) -- Open file/directory
vim.keymap.set("n", "h", "<C-^>", { remap = true, buffer = true }) -- Go up one directory
vim.keymap.set("n", ".", "gh", { remap = true, buffer = true }) -- Toggle hidden files
vim.keymap.set("n", "H", "u", { remap = true, buffer = true }) -- Preview directory
vim.keymap.set("n", "v", "mf", { remap = true, buffer = true }) -- Mark file   
