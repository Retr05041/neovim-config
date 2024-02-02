-- Default Vim Configuration
vim.g.mapleader = " "

-- Copy
vim.api.nvim_set_keymap("n", "<leader>c", '"+y<CR>', { noremap = true, silent = true })

-- Paste
vim.api.nvim_set_keymap("n", "<leader>v", '"+p<CR>', { noremap = true, silent = true })

-- Save
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })

-- Fast close
vim.api.nvim_set_keymap("n", "<leader>w", ":q<CR>", { noremap = true, silent = true })

-- Show line numbers
vim.opt.number = true

-- Tab spacing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
