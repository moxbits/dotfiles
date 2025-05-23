-- Telescope
vim.keymap.set(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files<cr>",
	{ noremap = true, silent = true, desc = "find file" }
)
vim.keymap.set(
	"n",
	"<leader>fg",
	"<cmd>Telescope live_grep<cr>",
	{ noremap = true, silent = true, desc = "search inside files" }
)
vim.keymap.set(
	"n",
	"<leader>fb",
	"<cmd>Telescope buffers<cr>",
	{ noremap = true, silent = true, desc = "opened buffers list" }
)

vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "help tags" })
vim.keymap.set(
	"n",
	"<leader>fr",
	"<cmd>Telescope resume<cr>",
	{ noremap = true, silent = true, desc = "resume previous telescope command" }
)
vim.keymap.set(
	"n",
	"<leader>fR",
	"<cmd>Telescope oldfiles<cr>",
	{ noremap = true, silent = true, desc = "show recently opened files" }
)

-- formatting
vim.keymap.set("n", "<leader>af", ':lua require("conform").format()<CR>', { noremap = true, silent = true })

-- linting
vim.keymap.set("n", "<leader>al", ':lua require("lint").try_lint()<CR>', { noremap = true, silent = true })

-- autocompletion
vim.keymap.set("i", "<C-Space>c", "<C-x><C-o>", { noremap = true, silent = true }) -- lsp
vim.keymap.set("i", "<C-Space>f", "<C-x><C-f>", { noremap = true, silent = true }) -- path
vim.keymap.set("i", "<C-Space>e", "<Plug>(emmet-expand-abbr)", { noremap = true, silent = true }) -- lsp emmet
