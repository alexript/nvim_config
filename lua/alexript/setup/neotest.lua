-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
        end,
    },
}, neotest_ns)

require("neotest").setup({
    floating = {
        border = "rounded",
        max_height = 0.85,
        max_width = 0.85,
        options = {}
    },
    -- log_level = 1,
    adapters = {
        require("neotest-go")({
            experimental = {
                test_table = true,
            },
            args = { "-count=1", "-timeout=60s" },
            recursive_run = true,
        }),
        require("neotest-java")({
            ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
        }),
        require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
        })
    },
})

local map = vim.api.nvim_set_keymap
map('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<cr>', KeymapDesc('Run the nearest test', {}))
map('n', '<leader>td', '<cmd>lua require("neotest").run.run({strategy="dap"})<cr>',
    KeymapDesc('Debug the nearest test (requires nvim-dap and adapter support)', {}))
map('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<cr>', {})
map('n', '<leader>to', '<cmd>lua require("neotest").output.open({enter=true})<cr>', {})
map('n', '<leader>ta', '<cmd>lua require("neotest").run.attach()<cr>', {})
map('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
    KeymapDesc('Run the current file', {}))
map('n', '<leader>te', '<cmd>lua require("neotest").run.stop()<cr>', {})
