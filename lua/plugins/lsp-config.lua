-- Language Server Config (BROKEN)

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Specify which language servers you want installed
        ensure_installed = {
          "lua_ls",
          "bashls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Must do a setup for each installed language server
      lspconfig.lua_ls.setup({})
      lspconfig.bashls.setup({})
      -- Keymaps for LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
