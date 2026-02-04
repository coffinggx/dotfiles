return {
	{
		"williamboman/mason.nvim",
		lazy = false, -- REQUIRED for headless
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
		"mfussenegger/nvim-jdtls",
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

			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
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

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				filetypes = { "rust" },
				settings = {
					["rust_analyzer"] = {
						cargo = { allFeatures = true },
					},
				},
			})

			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				maxTsServerMemory = 16000,
			})
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({
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

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			vim.keymap.set("n", "<leader>w", "<C-w>w")

			vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>Q", function()
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

