local ok, mason = pcall(require, "mason")
local ok_null_ls, mason_null_ls = pcall(require, "mason-null-ls")

if not ok then
	print("couldn't init the mason. maybe it is not installed!")
	return
end

if not ok_null_ls then
	print("couldn't init the mason null ls. maybe it is not installed!")
	return
end

-- init mason core
mason.setup({})

-- init mason for null-ls
mason_null_ls.setup({
	ensure_installed = { "stylua" },
	automatic_installation = true,
})
