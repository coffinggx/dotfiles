{ ... }:

{
  imports = [
    ./options.nix
    ./globals.nix
    ./autocmds.nix
    ./extra-config.nix

    ./plugins
    ./lsp
  ];

  programs.nixvim = {
    enable = true;
  };

  # Embed user's existing nvim config declaratively (contents inlined)
  home.file.".config/nvim/init.lua".text = ''
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
'';

  home.file.".config/nvim/lazy-lock.json".text = ''
{
  "LuaSnip": { "branch": "master", "commit": "0abc8f390b278c3b4aabc4c004ac8a088b65cf24" },
  "bufferline.nvim": { "branch": "main", "commit": "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3" },
  "cmp-nvim-lsp": { "branch": "main", "commit": "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
  "cmp_luasnip": { "branch": "master", "commit": "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
  "conform.nvim": { "branch": "master", "commit": "619363c30309d29ffa631e67c8183f2a72caa373" },
  "friendly-snippets": { "branch": "main", "commit": "6cd7280adead7f586db6fccbd15d2cac7e2188b9" },
  "gruber-darker": { "branch": "main", "commit": "9b68f84bfd6c1278fef2143802ca40c60f2471c0" },
  "gruvbox.nvim": { "branch": "main", "commit": "154eb5ff5b96d0641307113fa385eaf0d36d9796" },
  "harpoon": { "branch": "harpoon2", "commit": "87b1a3506211538f460786c23f98ec63ad9af4e5" },
  "kanagawa.nvim": { "branch": "master", "commit": "bb85e4bfc8d89b0e62c8fa53ccdd13d12e2f77b3" },
  "koda.nvim": { "branch": "main", "commit": "a7da3ced59eadafbda6eb4d7f7e2a6a3d9ecf858" },
  "live-server.nvim": { "branch": "main", "commit": "f1a2defb7bc3bfc37bcb455fafdf6d61113d71c8" },
  "lualine.nvim": { "branch": "master", "commit": "221ce6b2d999187044529f49da6554a92f740a96" },
  "lush.nvim": { "branch": "main", "commit": "9c60ec2279d62487d942ce095e49006af28eed6e" },
  "mason-lspconfig.nvim": { "branch": "main", "commit": "67029ccdac1ef8941e13b826417bc0ffac24cc86" },
  "mason-tool-installer.nvim": { "branch": "main", "commit": "443f1ef8b5e6bf47045cb2217b6f748a223cf7dc" },
  "mason.nvim": { "branch": "main", "commit": "2a6940af80375532e5e9e7c1f2fc6319a1b7a69d" },
  "maximizer.nvim": { "branch": "main", "commit": "d565201bae4b6ca4328ecd693b21b77132bfe02f" },
  "nvim-cmp": { "branch": "main", "commit": "2ffe79f1f021def8dd1fcd81deb16f1bb0d989f3" },
  "nvim-lint": { "branch": "master", "commit": "a219b2c9e5b4765e5c845aba119dad55806fcaf1" },
  "nvim-lspconfig": { "branch": "master", "commit": "1c0d8f70dbc8827263eedc3cf7021ceba0f68689" },
  "nvim-tree.lua": { "branch": "master", "commit": "b2aadda94b107480c48e548d6db51c6840b7b33c" },
  "nvim-treesitter": { "branch": "main", "commit": "7b6cc8949f9999c5ed91436cbe24aa5f99c42025" },
  "nvim-web-devicons": { "branch": "master", "commit": "2ae6958df7ced50baac5035cec0c15799eedfbf7" },
  "obsidian.nvim": { "branch": "main", "commit": "ae1f76a75c7ce36866e1d9342a8f6f5b9c2caf9b" },
  "plenary.nvim": { "branch": "master", "commit": "74b06c6c75e4eeb3108ec01852001636d85a932b" },
  "render-latex.nvim": { "branch": "main", "commit": "c5a546bfc9511e3197461e310e9f248e3c8a2d36" },
  "render-markdown.nvim": { "branch": "main", "commit": "f422cb5c6855f150e2ddcfaf44e7157b98b34f6a" },
  "rose-pine": { "branch": "main", "commit": "ff483051a47e27d84bdef47703538df1ed9f4a47" },
  "rust.vim": { "branch": "master", "commit": "889b9a7515db477f4cb6808bef1769e53493c578" },
  "telescope-ui-select.nvim": { "branch": "master", "commit": "6e51d7da30bd139a6950adf2a47fda6df9fa06d2" },
  "telescope.nvim": { "branch": "master", "commit": "427b576c16792edad01a92b89721d923c19ad60f" },
  "toggleterm.nvim": { "branch": "main", "commit": "9a88eae817ef395952e08650b3283726786fb5fb" },
  "tokyonight.nvim": { "branch": "main", "commit": "cdc07ac78467a233fd62c493de29a17e0cf2b2b6" },
  "undotree": { "branch": "main", "commit": "02b69aed427b848c4dca483fc5e9524b6019c296" },
  "vscode-gruber": { "branch": "main", "commit": "72c16999c0ced39f9d662dc39ffe9d54aabcea32" }
}
'';

  home.file.".config/nvim/nvim-pack-lock.json".text = ''
{
  "plugins": {
    "friendly-snippets": {
      "rev": "6cd7280adead7f586db6fccbd15d2cac7e2188b9",
      "src": "https://github.com/rafamadriz/friendly-snippets"
    },
    "mason.nvim": {
      "rev": "16ba83bfc8a25f52bb545134f5bee082b195c460",
      "src": "https://github.com/mason-org/mason.nvim"
    },
    "mini.nvim": {
      "rev": "9d0b9b7188d5c24b5a87f0d8b383ec8bda7a0de4",
      "src": "https://github.com/nvim-mini/mini.nvim"
    },
    "nvim-lspconfig": {
      "rev": "9573948c38bfabeec353ae7dd7d3ffec4c506a6b",
      "src": "https://github.com/neovim/nvim-lspconfig"
    },
    "nvim-treesitter": {
      "rev": "4916d6592ede8c07973490d9322f187e07dfefac",
      "src": "https://github.com/nvim-treesitter/nvim-treesitter"
    },
    "vim-fugitive": {
      "rev": "3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0",
      "src": "https://github.com/tpope/vim-fugitive"
    },
    "vim-moonfly-colors": {
      "rev": "261664f92ed51cf0c077555b2d4b2530307eac17",
      "src": "https://github.com/bluz71/vim-moonfly-colors"
    }
  }
}
'';

    home.file.".config/nvim/ftplugin/netrw.lua".text = ''
vim.keymap.set("n", "l", "<CR>", { remap = true, buffer = true }) -- Open file/directory
vim.keymap.set("n", "h", "<C-^>", { remap = true, buffer = true }) -- Go up one directory
vim.keymap.set("n", ".", "gh", { remap = true, buffer = true }) -- Toggle hidden files
vim.keymap.set("n", "H", "u", { remap = true, buffer = true }) -- Preview directory
vim.keymap.set("n", "v", "mf", { remap = true, buffer = true }) -- Mark file   
'';

    home.file.".config/nvim/lua/keybinds.lua".text = ''
vim.g.mapleader = " "

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

vim.keymap.set("n", "<leader>x", "<cmd>!make && make clean &&  make run<cr>", { desc = "Cpp build command)" })
-- vim.keymap.set("n", "<leader>x", "<cmd>!cargo run<cr>", { desc = "Zig build command)" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })



-- copy into clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '\"+y')
'';

    home.file.".config/nvim/lua/vim-options.lua".text = ''
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

-- Use the system clipboard by default
vim.opt.clipboard = "unnamedplus"

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
'';

    # Plugins
    home.file.".config/nvim/lua/plugins/colorscheme.lua".text = ''
function ColorMyPencils(color)
  color = color or "koda-moss"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "Comment", { italic = true })
    vim.api.nvim_set_hl(0, "Keyword", { italic = true })
end

return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
      })
    end,
  },
    {
        "rebelot/kanagawa.nvim",
        config = function ()
            require('kanagawa').setup({
                compile = false,             
                undercurl = true,            
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,        
                dimInactive = false,        
                terminalColors = true,
                colors = {  
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors)
                    return {}
                end,
                theme = "wave",
                background = {      
                    dark = "wave",
                    light = "lotus"
    },
})
        end,
    },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({})
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
      })

      vim.cmd("colorscheme rose-pine-main")

      ColorMyPencils()
    end,
  },
  {
    "blazkowolf/gruber-darker.nvim",
    name = "gruber-darker",
    config = function()
      require("gruber-darker").setup({})
    end,
  },
  {
    "shadowy-pycoder/vscode-gruber.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "vscode-gruber",
    branch = "main",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme vscode-gruber")
    end,
  },
  {
    "oskarnurm/koda.nvim",
    lazy = false, --
    priority = 1000,
    config = function()
      require("koda").setup({ dark = "dark", transparent = true })
      vim.cmd("colorscheme koda")
    end,
  },
  }
'';

    home.file.".config/nvim/lua/plugins/formatting.lua".text = ''
-- formatting.lua

return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- Event triggers to load the plugin
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        lua = { "stylua" },
        python = { "prettier", "black" },
        rust = { "rustfmt" },
      },
    })

    -- Key mapping for manual formatting
    vim.keymap.set({ "n", "v" }, "<leader>ff", function()
      conform.format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
'';

    home.file.".config/nvim/lua/plugins/completions.lua".text = ''
return {
  -- LSP completion source
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
      "rafamadriz/friendly-snippets", -- prebuilt snippets
    },
  },

  -- Completion plugin
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        -- disable automatic completion
        completion = {
          autocomplete = false,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          -- Tab key behavior
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback() -- insert tab / spaces normally
            end
          end, { "i", "s" }),

          -- Shift-Tab behavior
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback() -- normal fallback (does nothing in insert mode)
            end
          end, { "i", "s" }),

          -- Enter key confirms only if item is explicitly selected
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
'';

    home.file.".config/nvim/lua/plugins/harpoon.lua".text = ''
return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            local map = vim.keymap.set

            -- Add current file
            map("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon Add File" })

            -- Toggle quick menu
            map("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon Menu" })

            -- Jump to files
            map("n", "<leader>1", function() harpoon:list():select(1) end)
            map("n", "<leader>2", function() harpoon:list():select(2) end)
            map("n", "<leader>3", function() harpoon:list():select(3) end)
            map("n", "<leader>4", function() harpoon:list():select(4) end)

            -- Cycle through files
            map("n", "<C-S-P>", function()
                harpoon:list():prev()
            end, { desc = "Harpoon Previous" })

            map("n", "<C-S-N>", function()
                harpoon:list():next()
            end, { desc = "Harpoon Next" })
        end,
    },
}
'';

    home.file.".config/nvim/lua/plugins/lualine.lua".text = ''
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    lualine.setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_b = {
          { "branch" },
          { "diagnostics" },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("SalarLualineThemeSync", { clear = true }),
      callback = function()
        lualine.refresh()
      end,
    })
  end,
}
'';

    home.file.".config/nvim/lua/plugins/linting.lua".text = ''
return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      -- python = { "ruff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

  end,
}
'';

    home.file.".config/nvim/lua/plugins/telescope.lua".text = ''
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = false,
          },
          file_ignore_patterns = {
            "^%..*",
            "/%..*",

            "^.git/",
            "^.cache/",
            "^.local/",
            "^.direnv/",
            "^.venv/",
            "^node_modules/",
            ".git/",
            ".cache/",
            ".direnv/",
            ".venv/",
            "target",
            "build",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
'';

    home.file.".config/nvim/lua/plugins/treesitter.lua".text = ''
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
'';

    home.file.".config/nvim/lua/plugins/undotree.lua".text = ''
return {
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("undotree").setup({
        float_diff = true, -- set this `true` will disable layout option
        --- @type "left_bottom" | "left_left_bottom"
        layout = "left_bottom", -- {left}_{bottom} {left}_{left_bottom}
        --- @type "left" | "right"
        position = "left",
        window = {
          width = 0.25, -- the `undotree` window width percentage related to the editor
          height = 0.25, -- the `preview`(not floating) window height percentage related to the editor
          border = "rounded", -- float window
        },

        ignore_filetype = {},
        --- @type "compact" | "legacy"
        parser = "compact",

        keymaps = {
          ["move_next"] = "j",
          ["move_prev"] = "k",
          ["move2parent"] = "gj",
          ["move_change_next"] = "J",
          ["move_change_prev"] = "K",
          ["action_enter"] = "<cr>",
          ["enter_diffbuf"] = "p", -- is defined for both undotree and preview buffers, so it works as a toggle
          ["quit"] = "q", -- is defined for both undotree and preview buffers
        },
        keys = {
          {
            vim.keymap.set("n", "<leader>uo", require("undotree").open, { noremap = true, silent = true }),
          },
          {
            vim.keymap.set("n", "<leader>uc", require("undotree").close, { noremap = true, silent = true }),
          },
        },
      })
    end,
  },
}
'';
  };
}
