return {
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight]])
			require("xac.utils.colorscheme").darkifyColorscheme()
		end,
	},
}
