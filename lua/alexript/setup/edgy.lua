-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"


local edgy = require('edgy')
edgy.setup({
    left = {
        -- Neo-tree filesystem always takes half the screen height
        {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
            end,
            size = { height = 0.5 },
        },
        {
            title = "Neo-Tree Git",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            open = "Neotree position=right git_status",
        },
        {
            title = "Neo-Tree Buffers",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
            end,
            pinned = true,
            open = "Neotree position=top buffers",
        },
        {
            ft = "Outline",
            pinned = true,
            open = "SymbolsOutlineOpen",
        },
        -- any other neo-tree windows
        "neo-tree",
    },
})
