require('neogen').setup({
    enabled = true,
    snippet_engine = "luasnip",
})

local opts = { noremap = true, silent = true, desc = 'Generate annotation' }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
