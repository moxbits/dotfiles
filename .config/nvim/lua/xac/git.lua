local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
	print("could not init gitsigns. maybe it is not installed")
	return
end

gitsigns.setup({})
