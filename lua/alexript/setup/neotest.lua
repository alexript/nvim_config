require("neotest").setup({
    adapters = {
        --[[ require("neotest-python")({
            dap = { justMyCode = false },
        }),
        require("neotest-plenary"),
        require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
        }), ]]
    },
})


--[[ 

Run the nearest test

require("neotest").run.run()

Run the current file

require("neotest").run.run(vim.fn.expand("%"))

Debug the nearest test (requires nvim-dap and adapter support)

require("neotest").run.run({strategy = "dap"})

See :h neotest.run.run() for parameters.

Stop the nearest test, see :h neotest.run.stop()

require("neotest").run.stop()

Attach to the nearest test, see :h neotest.run.attach()

require("neotest").run.attach() 

]]
