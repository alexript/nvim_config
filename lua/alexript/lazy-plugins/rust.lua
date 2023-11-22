return {
    {
        "saecki/crates.nvim",
        -- tag = 'v0.3.0',
        event = { "BufRead Cargo.toml" },
        dependecies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    }
}

