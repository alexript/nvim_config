return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("alexript.setup.treesitter")
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
    "mrjones2014/nvim-ts-rainbow",
}

