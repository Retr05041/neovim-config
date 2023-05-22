-- <leader> = \ 
-- <CR> = enter (remove if you need confirmation before running a command)

-- Packer Sync

-- Telescope keymap
vim.keymap.set("n", '<leader>s', ':Telescope find_files<CR>')

-- nvim-tree
vim.keymap.set("n", '<leader>t', ':NvimTreeToggle<CR>')
