-- For autocompletion and snippits (done together as the autocomplete will work in tandem with snippits)

return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip", -- For autocompleting snippits
            "rafamadriz/friendly-snippets" -- Base snippets package
        },
    },
    
    { -- Controller for autocomplete
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')
            require("luasnip.loaders.from_vscode").lazy_load() -- Uses luasnip for autocompleting snippits
            
            cmp.setup({
                snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
                },
                window = { -- Window options
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({ -- Keybinds
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({ -- Sources for autocompletions
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                }, {
                { name = 'buffer' },
                })
            })

        end,
    }
}
