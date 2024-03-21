function KeymapDesc(desc, tplOpts)
    local opts = {}
    if tplOpts ~= nil then
        for k, v in pairs(tplOpts) do
            opts[k] = v
        end
    end
    opts.desc = desc
    return opts
end

-- move selected bloc up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", KeymapDesc("Move selected block Up"))
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", KeymapDesc("Move selected block Down"))

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, KeymapDesc("Format text in buffer")) -- format buffer
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, KeymapDesc("'so' buffer"))

vim.keymap.set("n", "J", "mzJ`z", KeymapDesc('Drop line under current line and stay in current line')) -- stay at line start on J

-- <C-d> and <C-u> with stay in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system buffer
vim.keymap.set("n", "<leader>y", '"+y', KeymapDesc("Yank to system buffer"))
vim.keymap.set("v", "<leader>y", '"+y', KeymapDesc("Yank to system buffer"))
vim.keymap.set("n", "<leader>Y", '"+Y', KeymapDesc("Yank to system buffer"))

-- delete to system buffer
vim.keymap.set("n", "<leader>d", '"_d', KeymapDesc("Delete to system buffer"))
vim.keymap.set("v", "<leader>d", '"_d', KeymapDesc("Delete to system buffer"))

-- regex replace master
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], KeymapDesc('Regex replace'))

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", KeymapDesc("Make it rain"))

if vim.fn.has("macunix") then
    vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")
end

-- diffview
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", KeymapDesc("Show file history"))

-- switch buffers by F9 and F10
vim.keymap.set({"n", "i"}, "<F9>", "<cmd>:bprevious<CR>", KeymapDesc("Swith to previous buffer"))
vim.keymap.set({"n", "i"}, "<F10>", "<cmd>:bnext<CR>", KeymapDesc("Swith to next buffer"))
vim.keymap.set({"n"}, "<F11>", "<cmd>:Bwipeout<CR>", KeymapDesc("Close buffer"))
