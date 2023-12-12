return {
    --[[ {
        "rcarriga/nvim-notify",
        config = function()
            require("alexript.setup.notify")
        end,
    }, ]]
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("alexript.setup.devicons")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("alexript.setup.lualine")
        end,
    }
}

