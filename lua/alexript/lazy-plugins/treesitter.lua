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
    {
        "danymat/neogen",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("alexript.setup.neogen")
        end,
    },
}
