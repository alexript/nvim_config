vim.g.barbar_auto_setup = false

require('barbar').setup({
    animation = true,
    auto_hide = 1,
    tabpages = true,
    clickable = true,
    icons = {
        buffer_index = false,
        buffer_number = true,
        gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
        },
        modified = { button = '●' },
        inactive = { button = '×' },
    },
    sidebar_filetypes = {
        NvimTree = true,
    },
})
