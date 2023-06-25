local ok, lualine = pcall(require, "lualine")

if not ok then
	print("Could not inti lualine. Maybe it is not installed!!!")
	return
end

lualine.setup()
