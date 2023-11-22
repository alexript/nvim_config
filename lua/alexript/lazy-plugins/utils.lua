return {
    "eandrju/cellular-automaton.nvim",
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    {
        "andweeb/presence.nvim",
        config = function()
            require("alexript.setup.presence")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("alexript.setup.scrollbar")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("alexript.setup.comment")
        end,
    },
    {
        "rest-nvim/rest.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("alexript.setup.rest-nvim")
        end,
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("alexript.setup.leap")
        end,
    },
    "Tastyep/structlog.nvim",
    "xiyaowong/virtcolumn.nvim",
    {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("alexript.setup.neoscroll")
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("alexript.setup.todo-comments")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = function()
            require("alexript.setup.ufo")
        end,
    },
    {
        "soulis-1256/hoverhints.nvim",
        config = function()
            require("alexript.setup.hoverhints")
        end,
    },
    {
        "nguyenvukhang/nvim-toggler",
        config = function()
            require("alexript.setup.toggler")
        end,
    },
    { "echasnovski/mini.nvim", branch = "stable" },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("alexript.setup.fidget")
        end,
    }
}

