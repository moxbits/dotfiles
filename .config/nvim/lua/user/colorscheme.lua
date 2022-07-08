-- tries to set colorscheme and if it isn't possible it will use default
vim.cmd [[
try
  colorscheme nord
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
