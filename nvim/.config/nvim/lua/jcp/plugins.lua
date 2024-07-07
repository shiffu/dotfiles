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

    -- Plugins start here
	use({"wbthomason/packer.nvim"})
	use({"nvim-lua/plenary.nvim"})
	use({"lewis6991/impatient.nvim"})
	use({"tpope/vim-surround"})
	use({"numToStr/Comment.nvim"})
	use({"kyazdani42/nvim-web-devicons"})
	use({"nvim-tree/nvim-tree.lua"})
	use({"akinsho/bufferline.nvim", requires = 'nvim-tree/nvim-web-devicons'})
	use({"moll/vim-bbye"})
	use({"nvim-lualine/lualine.nvim"})
	-- use({"lukas-reineke/indent-blankline.nvim"})
	use({"goolord/alpha-nvim"})
	use("folke/which-key.nvim")
    use("NvChad/nvim-colorizer.lua")

    -- Tmux Navigation intergration with nvim
	use("christoomey/vim-tmux-navigator")

	-- Colorschemes
    -- use 'marko-cerovac/material.nvim'
    use 'ellisonleao/gruvbox.nvim'

	-- Completion plugins
	use({"hrsh7th/nvim-cmp"})
	use({"hrsh7th/cmp-buffer"})
	use({"hrsh7th/cmp-path"})
	use({"hrsh7th/cmp-nvim-lsp"})
	use({"hrsh7th/cmp-nvim-lua"})

    -- GitSigns
    use("lewis6991/gitsigns.nvim")

    -- Mason
    use {"williamboman/mason.nvim", run = ":MasonUpdate"}   -- :MasonUpdate updates registry contents

	-- LSP
	use({"neovim/nvim-lspconfig"})
	use({"williamboman/nvim-lsp-installer"})
	use({"jose-elias-alvarez/null-ls.nvim"})

	-- Telescope
	use({"nvim-telescope/telescope.nvim"})

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
    
    -- Vimwiki and related plugins
    use { "vimwiki/vimwiki" }
    use { "iaamp/vimwiki-screenshot" }
    use { "plasticboy/vim-markdown" }
    use { "junegunn/goyo.vim" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
