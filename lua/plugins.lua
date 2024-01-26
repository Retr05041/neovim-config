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

	-- Theme
	use {'Mofiqul/dracula.nvim', as = 'dracula'}

	-- General language parser
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
	
	-- Github Co-pilot (setup is `:Copilot setup`)
	use {'github/copilot.vim'}

	-- Telescope Files
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	  }

	-- Dir Tree + Icons
	use {
	'nvim-tree/nvim-tree.lua',
	requires = {{'nvim-tree/nvim-web-devicons'}}
	}
	use 'nvim-tree/nvim-web-devicons'

	-- Bufferline
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	
	-- -- Ultisnips
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
