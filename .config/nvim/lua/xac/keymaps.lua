local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local merge = require("xac.utils.functions").merge

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Open Neovim configuration file
keymap("n", "<leader>ce", ":edit $MYVIMRC<CR>", merge(opts, { desc = "edit neovim configuration" }))
keymap("n", "<leader>cr", ":source $MYVIMRC<CR>", merge(opts, { desc = "reload neovim configuration" }))

-- Explorer
keymap("n", "<leader>e", ":Lex<CR>", merge(opts, { desc = "toggle netrw explorer" }))
keymap("n", "<leader>E", ":Lex %:p:h<CR>", merge(opts, { desc = "toggle netrw explorer" }))

-- Window Navigation
keymap("n", "<leader>h", "<C-w>h", merge(opts, { desc = "select left window" }))
keymap("n", "<leader>j", "<C-w>j", merge(opts, { desc = "select down window" }))
keymap("n", "<leader>k", "<C-w>k", merge(opts, { desc = "select up window" }))
keymap("n", "<leader>l", "<C-w>l", merge(opts, { desc = "select right window" }))

-- Working with Tabs
keymap("n", "<leader>tn", ":tabnew<CR>", merge(opts, { desc = "create new tab" }))
keymap("n", "<leader>tj", ":tabnext<CR>", merge(opts, { desc = "open next tab" }))
keymap("n", "<leader>tk", ":tabprevious<CR>", merge(opts, { desc = "open previous tab" }))
keymap("n", "<leader>th", ":tabfirst<CR>", merge(opts, { desc = "open first tab" }))
keymap("n", "<leader>tl", ":tablast<CR>", merge(opts, { desc = "open last tab" }))
keymap("n", "<leader>tc", ":tabclose<CR>", merge(opts, { desc = "close current tab" }))

-- Navigate buffers
keymap("n", "<leader>bh", ":bfirst<CR>", merge(opts, { desc = "go to first buffer" }))
keymap("n", "<leader>bk", ":bnext<CR>", merge(opts, { desc = "go to next buffer" }))
keymap("n", "<leader>bj", ":bprevious<CR>", merge(opts, { desc = "go to previous buffer" }))
keymap("n", "<leader>bl", ":blast<CR>", merge(opts, { desc = "go to last buffer" }))
keymap("n", "<leader>bt", ":term<CR>", merge(opts, { desc = "open a terminal mode" }))
keymap("n", "<leader>bg", ":Neogit<CR>", merge(opts, { desc = "open neogit buffer" }))

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Create new file
keymap("n", "<leader>bn", "<cmd>enew<cr>", merge(opts, { desc = "new empty buffer" }))
keymap(
	"n",
	"<leader>fN",
	":lua require('xac.utils.functions').create_new_file()<cr>",
	merge(opts, { desc = "new empty file" })
)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", merge(opts, { desc = "find file" }))
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", merge(opts, { desc = "search inside files" }))
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", merge(opts, { desc = "opened buffers list" }))
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", merge(opts, { desc = "help tags" }))
keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", merge(opts, { desc = "resume previous telescope command" }))
keymap("n", "<leader>fR", "<cmd>Telescope oldfiles<cr>", merge(opts, { desc = "show recently opened files" }))
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", merge(opts, { desc = "open projects" }))

-- Insert --
-- Press jj fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<leader>p", '"_dP', opts)
keymap("v", "<leader>d", '"_d', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- escaping from terminal mode
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- Custom --
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)

-- formatting
keymap("n", "<leader>af", ':lua require("conform").format()<CR>', opts)

-- linting
keymap("n", "<leader>al", ':lua require("lint").try_lint()<CR>', opts)

-- autocompletion
keymap("i", "<C-z>", "<C-x><C-o>", opts) -- lsp
keymap("i", "<C-s>", "<Plug>(emmet-expand-abbr)", opts) -- lsp

-- set spelling for english
vim.bo.spelllang = "en"

-- Define the function to toggle spell checking
function ToggleSpellCheck()
	if vim.wo.spell then
		vim.wo.spell = false
		print("Spell checking disabled")
	else
		vim.wo.spell = true
		print("Spell checking enabled")
	end
end

-- Create a command named "ToggleSpellCheck" and map it to the function
vim.cmd("command! ToggleSpellCheck lua ToggleSpellCheck()")
