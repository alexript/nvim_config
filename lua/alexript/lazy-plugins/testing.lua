return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim"
        },
        config = function()
            require("alexript.setup.neotest")
        end,
    }
}
