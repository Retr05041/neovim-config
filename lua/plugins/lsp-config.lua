-- Language Server Config (BROKEN)

return {
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- Specify which language servers you want installed
                ensure_installed = { "lua_ls", "bashls", "clangd", "cmake", "html", "cssls", "sqlls", "yamlls", "gopls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- Must do a setup for each installed language server
            lspconfig.lua_ls.setup {}
						lspconfig.bashls.setup {}
						lspconfig.clangd.setup {}
						lspconfig.cmake.setup {}
						lspconfig.html.setup {}
						lspconfig.cssls.setup {}
						lspconfig.sqlls.setup {}
						lspconfig.yamlls.setup {}
                        lspconfig.gopls.setup {}
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end
    }
}


