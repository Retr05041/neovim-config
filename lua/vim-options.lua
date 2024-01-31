-- Default Vim Configuration

-- Copy
vim.api.nvim_set_keymap('n', '<C-c>', '"+y<CR>', {noremap = true, silent = true})

-- Paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+p<CR>', {noremap = true, silent = true})

-- Save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true, silent = true})

-- Undo
vim.api.nvim_set_keymap('n', '<C-z>', ':u<CR>', {noremap = true, silent = true})

-- Fast close
vim.api.nvim_set_keymap('n', '<C-w>', ':q<CR>', {noremap = true, silent = true})

-- Show line numbers
vim.opt.number = true

-- Tab spacing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
