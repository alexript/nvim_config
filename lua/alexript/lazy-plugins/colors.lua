return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("alexript.setup.colors")
        end,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("alexript.setup.highlight-colors")
        end,
    },
    {
        "Bekaboo/deadcolumn.nvim",
        config = function()
            require("alexript.setup.deadcolumn")
        end,
    },
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require("alexript.setup.cursorline")
        end,
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            require('alexript.setup.colorful-winsep')
        end,
        event = { "WinNew" },
    }
}
