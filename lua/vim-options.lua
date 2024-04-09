-- Default Vim Configuration
vim.g.mapleader = " "

-- Copy
vim.keymap.set("", "<leader>y", '"+y<CR>', { noremap = true, silent = true })

-- Paste
vim.keymap.set("", "<leader>p", '"+p<CR>', { noremap = true, silent = true })

-- Save
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })

-- Fast close
vim.keymap.set("n", "<leader>w", ":q<CR>", { noremap = true, silent = true })

-- Show line numbers
vim.opt.number = true

-- Tab spacing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
