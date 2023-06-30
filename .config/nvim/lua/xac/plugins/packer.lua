local vim = vim or {}

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")

if not status_ok then
	print("could not init packer. maybe it is not installed")
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

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- My plugins here

	-- Themes
	use("haishanh/night-owl.vim")
  use("gbprod/nord.nvim")
  use("ellisonleao/gruvbox.nvim")

	-- treesitter highlightings
	use("nvim-treesitter/nvim-treesitter")
	use("p00f/nvim-ts-rainbow")

	-- autopairing plugin
	use("windwp/nvim-autopairs")

	-- easy-motion
	use("easymotion/vim-easymotion")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim")

	-- mason lsp, dap, linter and formatter manager
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jay-babu/mason-null-ls.nvim")
	use("neovim/nvim-lspconfig")

	-- autocompletion plugins
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")

	-- commenter
	use("numToStr/Comment.nvim")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- git integration
	use("lewis6991/gitsigns.nvim")

	-- project manager
	use("ahmedkhalf/project.nvim")

	-- which key
	use("folke/which-key.nvim")

	-- emmet
	use("mattn/emmet-vim")

  -- lualine
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end

end)
