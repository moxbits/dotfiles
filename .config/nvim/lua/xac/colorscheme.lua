local vim = vim or {}

local colorschemes = {
	night_owl = function()
		-- night owl theme configs
		vim.cmd("colorscheme night-owl")
	end,

	nord = function()
		-- nord theme configs
		vim.cmd("colorscheme nord")
		vim.cmd("highlight Normal guibg=black")
		vim.cmd("highlight SignColumn guibg=black")
		vim.cmd("highlight CursorLine guibg=#222222")
	end,

	gruvbox = function()
		-- gruvbox theme confings
		vim.o.background = "dark" -- or "light" for light mode
		vim.cmd([[colorscheme gruvbox]])
		vim.cmd("highlight Normal guibg=black")
		vim.cmd("highlight CursorLine guibg=#222222")
	end,
}

local selector = "gruvbox"
colorschemes[selector]()
