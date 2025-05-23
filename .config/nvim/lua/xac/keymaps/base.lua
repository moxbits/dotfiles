-- Basic Keymaps

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Editor options keymaps
vim.keymap.set(
	"n",
	"<leader>nr",
	":source $MYVIMRC<CR>",
	{ noremap = true, silent = true, desc = "reload neovim configuration" }
)

vim.keymap.set(
	"n",
	"<leader>nc",
	string.format(":cd %s | edit init.lua<CR>", vim.api.nvim_call_function("stdpath", { "config" })),
	{ noremap = true, silent = true, desc = "edit neovim configuration" }
)

vim.keymap.set("n", "<leader>nM", ":MessagesBuffer<CR>", { desc = "Open :messages in scratch buffer" })
vim.keymap.set("n", "<leader>nm", ":CopyMessages<CR>", { desc = "copy :messages to clipboard" })

-- Explorer
vim.keymap.set("n", "<leader>e", ":Lex<CR>", { noremap = true, silent = true, desc = "toggle netrw explorer" })

vim.keymap.set("n", "<leader>E", ":Lex %:p:h<CR>", { noremap = true, silent = true, desc = "toggle netrw explorer" })

-- Window Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true, desc = "select left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true, desc = "select down window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true, desc = "select up window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true, desc = "select right window" })

-- Working with Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true, desc = "create new tab" })
vim.keymap.set("n", "<leader>tj", ":tabnext<CR>", { noremap = true, silent = true, desc = "open next tab" })
vim.keymap.set("n", "<leader>tk", ":tabprevious<CR>", { noremap = true, silent = true, desc = "open previous tab" })
vim.keymap.set("n", "<leader>th", ":tabfirst<CR>", { noremap = true, silent = true, desc = "open first tab" })
vim.keymap.set("n", "<leader>tl", ":tablast<CR>", { noremap = true, silent = true, desc = "open last tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true, desc = "close current tab" })

-- Navigate buffers
vim.keymap.set("n", "<leader>bh", ":bfirst<CR>", { noremap = true, silent = true, desc = "go to first buffer" })
vim.keymap.set("n", "<leader>bk", ":bnext<CR>", { noremap = true, silent = true, desc = "go to next buffer" })
vim.keymap.set("n", "<leader>bj", ":bprevious<CR>", { noremap = true, silent = true, desc = "go to previous buffer" })
vim.keymap.set("n", "<leader>bl", ":blast<CR>", { noremap = true, silent = true, desc = "go to last buffer" })
vim.keymap.set("n", "<leader>bt", ":term<CR>", { noremap = true, silent = true, desc = "open a terminal mode" })

-- Create new file
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { noremap = true, silent = true, desc = "new empty buffer" })
vim.keymap.set(
	"n",
	"<leader>fN",
	":lua require('xac.utils.functions').create_new_file()<cr>",
	{ noremap = true, silent = true, desc = "new empty file" }
)

-- Insert --
-- Press jj fast to exit insert mode
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Terminal
-- escaping from terminal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Cancel text highlighting
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>", { noremap = true, silent = true })
