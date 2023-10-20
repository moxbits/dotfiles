local ok, treesitter_installer = pcall(require, "nvim-treesitter.install")
local ok_ts, treesitter_config = pcall(require, "nvim-treesitter.configs")

if not ok then
	print("could not get the installer for treesitter")
	return
end

if not ok_ts then
	print("could not get the configs for treesitter")
	return
end

treesitter_installer.update({ with_sync = true })

treesitter_config.setup({
	auto_install = true,
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})

