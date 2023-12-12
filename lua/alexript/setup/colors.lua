require("catppuccin").setup({
    flavour = "macchiato",
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mason = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        fidget = true,
        markdown = true,
        ufo = true,
        mini = {
            enabled = true,
            indentscope_color = "macchiato", -- catppuccin color (eg. `lavender`) Default: text
        },
        lsp_trouble = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd.colorscheme("catppuccin")
