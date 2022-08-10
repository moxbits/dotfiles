vim.cmd "syntax on"

local options = {
  fileencoding = "utf-8",                  -- the encoding written to a file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- sources used for autocompletion in neovim built-in tools
  updatetime = 300,                        -- faster completion (4000ms default)
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  undofile = true,                         -- enable persistent undo
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- tab configs
  expandtab = true,                        -- convert tabs to spaces
  tabstop = 2,                             -- insert 2 spaces for a tab
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  smartindent = true,                      -- make indenting smarter again

  -- line configs
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  cursorline = true,                       -- highlight the current line
  wrap = true,                            -- display lines as one long line
  ruler = false,

  -- ui
  mouse = "a",                             -- allow the mouse to be used in neovim
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


