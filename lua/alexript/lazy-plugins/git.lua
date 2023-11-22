return {
    {
        "tpope/vim-fugitive",
        config = function()
            require("alexript.setup.fugitive")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("alexript.setup.gitsigns")
        end,
    },
    { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}

