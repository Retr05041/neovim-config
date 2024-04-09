-- Language Server Config (BROKEN)

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  { -- https://github.com/williamboman/mason-lspconfig.nvim
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Specify which language servers you want installed (be sure to add to treesitter.lua)
        ensure_installed = {
          "jsonls", -- JSON
          "lua_ls", -- Lua
          -- "bashls", -- Bash
          -- "clangd", -- C/C++
          -- "csharp_ls", -- C#
          "gopls", -- GO
          "jedi_language_server", -- Python
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- We want to advertise to each language server that there is more we need to add
      -- This is for the autocompletion, to be able to use the language server as another source
      -- See completions.lua
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      -- Must do a setup for each installed language server
      -- Make sure to add the capabilities for completion
      lspconfig.jsonls.setup({capabilities=capabilities})
      lspconfig.lua_ls.setup({capabilities=capabilities})
      -- lspconfig.bashls.setup({capabilities=capabilities})
      -- lspconfig.clangd.setup({capabilities=capabilities})
      -- lspconfig.csharp_ls.setup({capabilities=capabilities})
      lspconfig.gopls.setup({capabilities=capabilities})
      lspconfig.jedi_language_server.setup({capabilities=capabilities})
      -- Keymaps for LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
