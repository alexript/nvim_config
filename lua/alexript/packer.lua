local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")

        use({
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            -- or                            , branch = '0.1.x',
            requires = { { "nvim-lua/plenary.nvim" } },
            config = function()
                require("alexript.setup.telescope")
            end,
        })

        use({
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("alexript.setup.colors")
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("alexript.setup.treesitter")
            end,
        })
        use("nvim-treesitter/nvim-treesitter-context")
        use("nvim-treesitter/playground")
        use("mrjones2014/nvim-ts-rainbow")
        use({
            "mbbill/undotree",
            config = function()
                require("alexript.setup.undotree")
            end,
        })
        use({
            "tpope/vim-fugitive",
            config = function()
                require("alexript.setup.fugitive")
            end,
        })
        use({
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x",
            requires = {
                -- LSP Support
                { "neovim/nvim-lspconfig" }, -- Required
                {
                    "williamboman/mason.nvim",
                    run = ":MasonUpdate",
                },                           -- Optional
                { "williamboman/mason-lspconfig.nvim" }, -- Optional

                -- Autocompletion
                { "hrsh7th/nvim-cmp" }, -- Required
                { "hrsh7th/cmp-nvim-lsp" }, -- Required
                { "hrsh7th/cmp-buffer" }, -- Optional
                { "hrsh7th/cmp-path" }, -- Optional
                { "saadparwaiz1/cmp_luasnip" }, -- Optional
                { "hrsh7th/cmp-nvim-lua" }, -- Optional

                -- Snippets
                { "L3MON4D3/LuaSnip" }, -- Required
                { "rafamadriz/friendly-snippets" }, -- Optional
            },
            config = function()
                require("alexript.setup.lsp")
            end,
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("alexript.setup.null-ls")
            end,
        })
        use({
            "LhKipp/nvim-nu",
            run = ":TSInstall nu",
            config = function()
                require("alexript.setup.nu")
            end,
        })
        use("eandrju/cellular-automaton.nvim")
        use({
            "nvim-tree/nvim-tree.lua",
            config = function()
                require("alexript.setup.nvim-tree")
            end,
        })
        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("alexript.setup.gitsigns")
            end,
        })

        use({
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
        })
        use({
            "rebelot/heirline.nvim",
            config = function()
                require("alexript.setup.heirline")
            end,
        })
        use({
            "rcarriga/nvim-notify",
            config = function()
                require("alexript.setup.notify")
            end,
        })
        use({ "fatih/vim-go" })
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "nvim-tree/nvim-web-devicons", opt = true },
            config = function()
                require("alexript.setup.lualine")
            end,
        })
        use({
            "nvim-tree/nvim-web-devicons",
            config = function()
                require("alexript.setup.devicons")
            end,
        })
        use({
            "andweeb/presence.nvim",
            config = function()
                require("alexript.setup.presence")
            end,
        })
        use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
        use({
            "petertriho/nvim-scrollbar",
            config = function()
                require("alexript.setup.scrollbar")
            end,
        })
        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        })
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("alexript.setup.comment")
            end,
        })
        use({
            "rest-nvim/rest.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("alexript.setup.rest-nvim")
            end,
        })
        use({
            "ggandor/leap.nvim",
            requires = { "tpope/vim-repeat" },
            config = function()
                require("alexript.setup.leap")
            end,
        })
        use("Tastyep/structlog.nvim")
        use({
            "ahmedkhalf/lsp-rooter.nvim",
            config = function()
                require("lsp-rooter").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        })
        use({
            "ray-x/lsp_signature.nvim",
            config = function()
                require("alexript.setup.lsp_signature")
            end,
        })
        use({
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons",
            config = function()
                require("alexript.setup.trouble")
            end,
        })
        use({
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
        })
        use({
            "karb94/neoscroll.nvim",
            config = function()
                require("alexript.setup.neoscroll")
            end,
        })
        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("alexript.setup.todo-comments")
            end,
        })
        use({
            "brenoprata10/nvim-highlight-colors",
            config = function()
                require("alexript.setup.highlight-colors")
            end,
        })
        use({
            "Bekaboo/deadcolumn.nvim",
            config = function()
                require("alexript.setup.deadcolumn")
            end,
        })
        use({
            "yamatsum/nvim-cursorline",
            config = function()
                require("alexript.setup.cursorline")
            end,
        })
        use("xiyaowong/virtcolumn.nvim")
        use({
            "kevinhwang91/nvim-ufo",
            requires = "kevinhwang91/promise-async",
            config = function()
                require("alexript.setup.ufo")
            end,
        })
        use({
            "nguyenvukhang/nvim-toggler",
            config = function()
                require("alexript.setup.toggler")
            end,
        })
        use({ "echasnovski/mini.nvim", branch = "stable" })

        use({
            "saecki/crates.nvim",
            -- tag = 'v0.3.0',
            event = { "BufRead Cargo.toml" },
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("crates").setup()
            end,
        })

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
