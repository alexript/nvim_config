return {
    "LhKipp/nvim-nu",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    build = ":TSInstall nu",
    config = function()
        require("alexript.setup.nu")
    end,
}

