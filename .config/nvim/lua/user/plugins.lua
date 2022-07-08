local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use { "wbthomason/packer.nvim" } -- Have packer manage itself

  -- colorscheme
  use { "arcticicestudio/nord-vim" }

  -- autopair 
	use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  }

  -- rainbow delimiters
  use { "p00f/nvim-ts-rainbow" }

  -- lualine
  use {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- lsp
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  -- completion
  use { "hrsh7th/nvim-cmp" }       -- Autocompletion plugin
  use { "hrsh7th/cmp-nvim-lsp" }   -- LSP source for nvim-cmp

  -- snippet
  use { "saadparwaiz1/cmp_luasnip" }      -- Snippets source for nvim-cmp
  use { "L3MON4D3/LuaSnip" }              -- Snippets plugin

  -- comment
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
