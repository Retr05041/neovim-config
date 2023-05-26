-- Setup Tree
require("nvim-tree").setup()

-- Dracula
require("dracula").setup()
vim.cmd[[colorscheme dracula]]

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsEditSplit = "vertical"
