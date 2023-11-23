local ts = require('telescope')

ts.setup({
    defaults = {
    },
    pickers = {
        builtin = {
            theme = "dropdown",
        },
        --[[ git_commits = {
            theme = "dropdown",
        } ]]
    },
    extensions = {
        project = {
            theme = "cursor",
            sync_with_nvim_tree = true,
            on_project_selected = function(bufnr)
                local project_actions = require("telescope._extensions.project.actions")
                project_actions.change_working_directory(bufnr)
            end,
        }
    }
})
ts.load_extension('project')

local ts_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", ts_builtin.find_files, {}) -- project files
vim.keymap.set("n", "<C-p>", ts_builtin.git_files, {})       -- git files
vim.keymap.set("n", "<leader>bb", ts_builtin.buffers, {})
vim.keymap.set("n", "<leader>bi", ts_builtin.builtin, {})
vim.keymap.set("n", "<leader>fh", ts_builtin.command_history, {})
vim.keymap.set("n", "<leader>ps", ts_builtin.live_grep, {})
vim.keymap.set("n", "<leader>hk", ts_builtin.keymaps, {})

-- extensions
vim.keymap.set("n", "<leader>pp", ts.extensions.project.project, {})
print ('telescope configured')
