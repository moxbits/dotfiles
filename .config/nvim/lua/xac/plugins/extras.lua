local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
local ok_commenter, commenter = pcall(require, "Comment")
local ok_which_key, which_key = pcall(require, "which-key")
local ok_autopairs, nvim_autopairs = pcall(require, "nvim-autopairs")

if not ok_gitsigns then
	print("could not init gitsigns. maybe it is not installed")
	return
end

if not ok_commenter then
	print("Could not init commnet.nvim. maybe it is not installed")
	return
end

if not ok_which_key then
	print("could not init which-key. maybe it is not installed")
	return
end

if not ok_autopairs then
	print("couldn't init the autoparing plugin. Maybe it is not installed yet!")
	return
end

gitsigns.setup({})
commenter.setup({})
which_key.setup({})
nvim_autopairs.setup({})
