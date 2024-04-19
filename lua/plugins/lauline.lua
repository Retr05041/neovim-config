-- Statusline at the bottom (uses nerd wonts)

return {
  "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          icons_enabled = false,
        },
      })
    end,
}

