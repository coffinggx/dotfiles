return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          -- "rust_analyzer",
          "ts_ls",
          "html",
          "zls",
          "cssls",
          "pyright",
           --"tailwindcss",
        },
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "black",
          "eslint_d",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- diagnostics UI
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- NEW LSP CONFIG (no lspconfig require)
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("zls", { capabilities = capabilities })
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        filetypes = { "rust" },
        settings = {
          ["rust_analyzer"] = {
            cargo = { allFeatures = true },
          },
        },
      })

      vim.lsp.config("html", { capabilities = capabilities })
      vim.lsp.config("clangd", { capabilities = capabilities })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        maxTsServerMemory = 16000,
      })
      vim.lsp.config("cssls", { capabilities = capabilities })
      vim.lsp.config("gopls", { capabilities = capabilities })
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        filetypes = {
          "html",
          "html-eex",
          "vitereact",
          "css",
          "postcss",
          "javascriptreact",
          "typescriptreact",
        },
      })

      -- ENABLE ALL
      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "html",
        "clangd",
        "ts_ls",
        "cssls",
        "gopls",
        "tailwindcss",
      })

      -- keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

      vim.keymap.set("n", "<leader>w", "<C-w>w")

      vim.keymap.set("n", "<leader>q", function()
        vim.diagnostic.setloclist()
        vim.cmd("lopen")
      end)

      vim.keymap.set("n", "<leader>qc", "<cmd>lclose<cr>")

      vim.keymap.set("n", "<leader>cA", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.fixAll" } },
        })
      end)
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
}
