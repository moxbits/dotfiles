local ok, null_ls = pcall(require, "null-ls")

if not ok then
	print("could not init null-ls. maybe it is not installed")
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
})
