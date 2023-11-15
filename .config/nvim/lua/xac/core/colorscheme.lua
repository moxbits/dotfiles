local ok_base16, _ = pcall(require, "base16-colorscheme")

-- colorscheme
if ok_base16 then
	vim.cmd("colorscheme base16-solarized-dark")
else
	vim.cmd("colorscheme torte")
end

vim.cmd("hi Normal guibg=black ctermbg=black")
vim.cmd("hi NormalNC guibg=black ctermbg=black")

vim.cmd("hi LineNr guibg=black ctermbg=black")
vim.cmd("hi CursorLine guibg=#222222")
vim.cmd("hi CursorLineNr guibg=#222222")

vim.cmd("hi SignColumn guibg=black ctermbg=black")

vim.cmd("hi WinSeparator guibg=None") -- ugly split border color
