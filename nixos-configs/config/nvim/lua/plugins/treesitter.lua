return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "python", "rust", "javascript", "zig" },
      highlight = { enable = true },
      indent = { enable = true },
      disable={"python"},
      playground = { enable = true },
    },
  },
}
