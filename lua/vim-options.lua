-- Custom keybinds

-- Copy
vim.api.nvim_set_keymap('n', '<C-c>', '"+y<CR>', {noremap = true, silent = true})

-- Paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+p<CR>', {noremap = true, silent = true})

-- Save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true, silent = true})

-- Undo
vim.api.nvim_set_keymap('n', '<C-z>', ':u<CR>', {noremap = true, silent = true})