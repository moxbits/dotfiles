local ok, null_ls = pcall(require, "null-ls")
local ok_null_ls, mason_null_ls = pcall(require, "mason-null-ls")

if not ok then
	print("could not init null-ls. maybe it is not installed")
	return
end

if not ok_null_ls then
	print("couldn't init the mason null ls. maybe it is not installed!")
	return
end

mason_null_ls.setup({})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.beautysh,
		-- null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.flake8,
		-- null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.code_actions.eslint,
	},
})
