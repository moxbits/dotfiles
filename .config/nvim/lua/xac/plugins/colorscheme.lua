return {
	{
		"Mofiqul/vscode.nvim",
		config = function()
			vim.o.background = "dark"

			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
        disable_nvimtree_bg = true,
      })

			vim.cmd.colorscheme("vscode")

			require("xac.utils.colorscheme").darkifyColorscheme()
		end,
	},
}
