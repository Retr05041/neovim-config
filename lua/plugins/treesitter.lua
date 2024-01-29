 -- Fuzzy Finder
 return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"html", "css", "javascript", "python", "cpp", "lua", "bash", "json", "yaml"},
            highlight = {enable = true,},
            indent = {enable = true},
        })
    end
}