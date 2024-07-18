local dap, dapui = require("dap"), require("dapui")
require("neodev").setup({
    library = {
        plugins = { "nvim-dap-ui" },
        types = true
    },
})
dapui.setup()

require('telescope').load_extension('dap')
require("nvim-dap-virtual-text").setup()
require('dap-go').setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F8>', require 'dap'.step_over)
vim.keymap.set('n', '<F7>', require 'dap'.step_into)
vim.keymap.set('n', '<F6>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

