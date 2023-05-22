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

	-- Telescope
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
end)
