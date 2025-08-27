return {
	{
		"williamboman/mason.nvim",
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
					"rust_analyzer",
					"ts_ls",
					"html",
					"cssls",
					-- "gopls",
					"pyright",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"black", -- python formatter
					-- "pylint", -- python linter
					"eslint_d",
					"rustfmt",
					"clang-format",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			virtual_text = true,
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Configure diagnostic display - only in normal mode
			vim.diagnostic.config({
				virtual_text = false, -- Show diagnostic messages as virtual text
				signs = true, -- Show diagnostic signs in the sign column
				underline = true, -- Underline diagnostics
				update_in_insert = false, -- Hide diagnostics in insert mode
				severity_sort = true, -- Sort diagnostics by severity
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Add autocommands to specifically hide diagnostics in insert mode
			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					vim.diagnostic.hide()
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function()
					vim.diagnostic.show()
				end,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				filetypes = { "rust" },
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
			})

			lspconfig["clangd"].setup({
				capabilities = capabilities,
			})

			-- configure typescript server with plugin
			lspconfig["ts_ls"].setup({
				capabilities = capabilities,
				-- 16 gb
				maxTsServerMemory = 16000,
			})

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
			})

			lspconfig["gopls"].setup({
				capabilities = capabilities,
			})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({
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

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {}) -- go to declaration
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- Add keybind to show diagnostics in a floating window
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
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
