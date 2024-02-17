-- Fuzzy Finder / highlighter 
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      -- Add more as you use more languages (be sure to add to lsp-config.lua) - Language not dependant
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "json", "bash", "go", "python" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
