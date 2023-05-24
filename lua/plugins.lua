-- This file can be loaded by calling `require('plugins')` from your init.lua
-- When editing this file, run the command `source %`

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- disable netrw - for nvim-tree 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups - for nvim-tree
vim.opt.termguicolors = true

return require('packer').startup(function(use)
	-- Use the base packer before anything else
	use 'wbthomason/packer.nvim'

	-- General language parser
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	
	-- Github Co-pilot (setup is `:Copilot setup`)
	use {'github/copilot.vim'}

	-- I have no idea what treesitter does, but it is incredibly important
    	-- Mostly, it provides better syntax highlighting but i believe it also exposes a bunch of language endpoints to the lsp
    	-- It's practically natively supported in neovim and is a dependency for almost everything so I'm just dropping it at the top node
	use {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Tree
	use {
	'nvim-tree/nvim-tree.lua',
	requires = {{'nvim-tree/nvim-web-devicons'}}
	}
	
	-- Theme
	use {'Mofiqul/dracula.nvim', as = 'dracula'}

	-- Automatically set up your configuration after cloning packer.nvim
    	-- Put this at the end after all plugins
    	if packer_bootstrap then
        	require('packer').sync()
    	end
end)
