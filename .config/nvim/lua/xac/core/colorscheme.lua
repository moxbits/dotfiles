local ok_base16, _ = pcall(require, "base16-colorscheme")

-- colorscheme
if ok_base16 then
	vim.cmd("colorscheme base16-gruvbox-dark-hard")
else
	vim.cmd("colorscheme torte")
end

vim.cmd("hi Normal guibg=None ctermbg=None")
vim.cmd("hi NormalNC guibg=None ctermbg=None")

vim.cmd("hi LineNr guibg=None ctermbg=None")
vim.cmd("hi CursorLine guibg=#222222")
vim.cmd("hi CursorLineNr guibg=#222222")

vim.cmd("hi SignColumn guibg=None ctermbg=None")

vim.cmd("hi WinSeparator guibg=None") -- ugly split border color
