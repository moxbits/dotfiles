return {
	"nvimdev/dashboard-nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				week_header = {
					enable = true,
				},
				center = {
					{
						icon = "+ ",
						desc = "Empty Buffer",
						key = "n",
						keymap = "SPC b",
						action = "enew",
					},
					{
						icon = " ",
						desc = "New File",
						key = "N",
						keymap = "SPC f",
						action = "lua require('xac.utils.functions').create_new_file()",
					},
					{
						icon = " ",
						desc = "Find File",
						key = "f",
						keymap = "SPC f",
						action = "Telescope find_files",
					},
					{
						icon = " ",
						desc = "Recent Files",
						key = "R",
						keymap = "SPC f",
						action = "Telescope oldfiles",
					},
					{
						icon = " ",
						desc = "Open Project",
						key = "p",
						keymap = "SPC f",
						action = "Telescope projects",
					},
					{
						icon = " ",
						desc = "Open Neovim Config     ",
						key = "e",
						keymap = "SPC c",
						action = "edit $MYVIMRC",
					},
				},
			},
		})
	end,
}
