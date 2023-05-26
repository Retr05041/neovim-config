-- This file can be loaded by calling `require('plugins')` from your init.lua
-- When editing this file, run the command `source %`

-- Bootstrap packer.nvim if it doesn't exist
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end


-- Run the bootstrap function
local packer_bootstrap = ensure_packer()


-- Plugins
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
	
	-- Ultisnips
	use {
	'SirVer/ultisnips',
	requires = {{'honza/vim-snippets'}}
	}

	-- Automatically set up your configuration after cloning packer.nvim
    	-- Put this at the end after all plugins
    	if packer_bootstrap then
        	require('packer').sync()
    	end
end)
