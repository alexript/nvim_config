return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            require("alexript.setup.debug")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            'nvim-telescope/telescope.nvim',

        }
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    }
}
