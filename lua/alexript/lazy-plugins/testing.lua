return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            -- adapters
            'nvim-neotest/neotest-vim-test',
            "nvim-neotest/neotest-go",
            'rcasia/neotest-java',
        },
        config = function()
            require("alexript.setup.neotest")
        end,
    }
}
