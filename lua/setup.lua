-- Dracula Theme
require("dracula").setup()
vim.cmd[[colorscheme dracula]]

-- Setup Dir Tree + Icons
require("nvim-tree").setup()
require("nvim-web-devicons").setup()

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsEditSplit = "vertical"

-- Bufferline
require("bufferline").setup{}

