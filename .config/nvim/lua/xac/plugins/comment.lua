local ok, commenter = pcall(require, "Comment")

if not ok then
	print("Could not init commnet.nvim. maybe it is not installed")
	return
end

commenter.setup({})
