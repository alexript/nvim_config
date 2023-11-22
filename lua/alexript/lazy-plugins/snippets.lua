return {
    "rafamadriz/friendly-snippets",
    {
        "L3MON4D3/LuaSnip",
        --            build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
        dependencies = {
            "rafamadriz/friendly-snippets",
            "benfowler/telescope-luasnip.nvim",
        },
        config = function(_, opts)
            if opts then require("luasnip").config.setup(opts) end
            require("alexript.setup.luasnip")
        end,
    }
}

