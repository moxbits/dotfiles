return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"HiPhish/nvim-ts-rainbow2",
	},
	config = function()
		require("nvim-treesitter.install").update({ with_sync = true })
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
