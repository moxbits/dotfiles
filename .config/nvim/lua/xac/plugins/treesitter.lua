return {
	"nvim-treesitter/nvim-treesitter",
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
		})
	end,
}
