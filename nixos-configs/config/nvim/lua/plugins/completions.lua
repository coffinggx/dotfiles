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
