vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<M-h>", function() vim.cmd("bprevious") end)
vim.keymap.set("n", "<M-l>", function() vim.cmd("bNext") end)
vim.keymap.set("n", "<M-Left>", function() vim.cmd("bprevious") end)
vim.keymap.set("n", "<M-Right>", function() vim.cmd("bNext") end)

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
