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
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				terraform = { "terraform_fmt" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				c = { "clang-format" },
			},
			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
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
		-- Optionally, you can set up format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,
				})
			end,
		})
	end,
}
