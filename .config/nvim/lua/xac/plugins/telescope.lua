return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			file_ignore_patterns = { "node_modules", ".git" },
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})
	end,
}
