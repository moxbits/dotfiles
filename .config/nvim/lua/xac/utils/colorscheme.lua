local M = {}

function M.darkifyColorscheme()
  vim.cmd("hi Normal guibg=None ctermbg=None")
  vim.cmd("hi NormalNC guibg=None ctermbg=None")
  vim.cmd("hi LineNr guibg=None ctermbg=None")
  vim.cmd("hi CursorLine guibg=#111111")
  vim.cmd("hi CursorLineNr guibg=#111111")
  vim.cmd("hi SignColumn guibg=None ctermbg=None")
  vim.cmd("hi WinSeparator guibg=None") -- ugly split border color

  vim.cmd("hi NvimTreeNormal guibg=None ctermbg=None")
end

return M
