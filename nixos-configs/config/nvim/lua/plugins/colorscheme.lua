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
