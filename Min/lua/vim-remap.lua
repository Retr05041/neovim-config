-- Remake / set keymaps 
vim.g.mapleader = " "

vim.keymap.set({"n", "v"}, "<leader>y", '"+y<CR>', { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "<leader>p", '"+p<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":lua require(\"luasnip.loaders\").edit_snippet_files()<CR>", { noremap = true, silent = true})

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true"})
