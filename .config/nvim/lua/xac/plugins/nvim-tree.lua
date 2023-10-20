local ok_tree, nvim_tree = pcall(require, "nvim-tree")

if not ok_tree then
	print("could not init nvim-tree. maybe it is not installed")
	return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup()
