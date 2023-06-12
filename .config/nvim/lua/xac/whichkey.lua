local ok, which_key = pcall(require, "which-key")

if not ok then
	print("could not init which-key. maybe it is not installed")
	return
end

which_key.setup({})
