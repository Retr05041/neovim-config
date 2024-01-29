-- Language Server Config (BROKEN)

return {
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        config = function() 
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- Specify which language servers you want installed
                ensure_installed = { "lua_ls" }
            })
            local lspconfig = require("lspconfig")
            -- Must do a setup for each installed language server
            lspconfig.lua_ls.setup {}

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end
    }
}