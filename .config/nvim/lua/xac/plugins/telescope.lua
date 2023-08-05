local vim = vim or {}

local ok, telescope = pcall(require, "telescope")
local ok_builtins, builtin = pcall(require, "telescope.builtin")

if not ok then
	print("could not init telescope. maybe it is not installed")
	return
end

if not ok_builtins then
	print("could not access the builtins of telescope")
	return
end

-- setting up the keymaps for telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- init telescope
telescope.setup({
	pickers = {
		find_files = {
			hidden = true, -- Show hidden files and folders
		},
	},
})

vim.api.nvim_set_keymap("n", "<Space>fr", ":Telescope resume<CR>", { silent = true })
