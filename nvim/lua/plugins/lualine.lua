return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",        -- adapts to dark colorscheme
				globalstatus = true,   -- single statusline
				component_separators = "",
				section_separators = "",
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { 
					{ "filename", path = 1 } -- relative path
				},

				lualine_x = {
					"diagnostics",
					"filetype",
				},

				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
