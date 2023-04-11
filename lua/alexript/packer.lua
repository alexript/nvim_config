vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use(
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    )
    use("nvim-treesitter/nvim-treesitter-context");
    use('nvim-treesitter/playground')
    use('mrjones2014/nvim-ts-rainbow')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                'williamboman/mason.nvim',
                run = ':MasonUpdate'
            },                                       -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        },
    }
    use("eandrju/cellular-automaton.nvim")
    use { 'nvim-tree/nvim-tree.lua' }
    use('lewis6991/gitsigns.nvim')

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use('rebelot/heirline.nvim')
    use('rcarriga/nvim-notify')
    use { 'fatih/vim-go' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('nvim-tree/nvim-web-devicons')
    use('andweeb/presence.nvim')
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use("petertriho/nvim-scrollbar")
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }
    use {
        'ggandor/leap.nvim',
        requires = { 'tpope/vim-repeat' }
    }
    use('Tastyep/structlog.nvim')
    use {
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
            require("lsp-rooter").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use('ray-x/lsp_signature.nvim')
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({
        'karb94/neoscroll.nvim',
    })
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use('brenoprata10/nvim-highlight-colors')
    use('Bekaboo/deadcolumn.nvim')
    use('yamatsum/nvim-cursorline')
end)
