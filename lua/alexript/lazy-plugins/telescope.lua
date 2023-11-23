return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',

        -- extensions
        "nvim-telescope/telescope-project.nvim",
        "chip/telescope-software-licenses.nvim",
        "gbrlsnchs/telescope-lsp-handlers.nvim",
    },

    config = function()
        require("alexript.setup.telescope")
    end,
}
