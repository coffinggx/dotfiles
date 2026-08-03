return{
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 20,
      direction = "horizontal", -- or "float"
      open_mapping = [[<c-t>]],
      terminal_mappings = true,
      shell = vim.o.shell,
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
    })
  end
}
