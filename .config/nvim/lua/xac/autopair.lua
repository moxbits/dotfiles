local ok, nvim_autopairs = pcall(require, "nvim-autopairs")

if not ok then
	print("couldn't init the autoparing plugin. Maybe it is not installed yet!")
	return
end

nvim_autopairs.setup({})
