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
        },
        lsp_handlers = {
            disable = {},
            location = {
                telescope = {},
                no_results_message = 'No references found',
            },
            symbol = {
                telescope = {},
                no_results_message = 'No symbols found',
            },
            call_hierarchy = {
                telescope = {},
                no_results_message = 'No calls found',
            },
            code_action = {
                telescope = require('telescope.themes').get_dropdown({}),
                no_results_message = 'No code actions available',
                prefix = '',
            },
        },
        emoji = {
            action = function(emoji)
                -- argument emoji is a table.
                -- {name="", value="", cagegory="", description=""}
                --
                -- insert emoji when picked
                vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
        },
        lazy = {
            show_icon = true,
        }
    }
})
ts.load_extension('project')
ts.load_extension("software-licenses")
ts.load_extension('lsp_handlers')
ts.load_extension("emoji")
ts.load_extension('luasnip')
ts.load_extension("lazy")

local ts_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", ts_builtin.find_files, KeymapDesc('Show files in project')) -- project files
vim.keymap.set("n", "<C-p>", ts_builtin.git_files, KeymapDesc("Show git files"))              -- git files
vim.keymap.set("n", "<leader>bb", ts_builtin.buffers, KeymapDesc("Select buffer"))
vim.keymap.set("n", "<leader>bi", ts_builtin.builtin, KeymapDesc("Select ts builtin"))
vim.keymap.set("n", "<leader>fh", ts_builtin.command_history, KeymapDesc('Select from command history'))
vim.keymap.set("n", "<leader>ps", ts_builtin.live_grep, KeymapDesc("Do a live grep"))
vim.keymap.set("n", "<leader>hk", ts_builtin.keymaps, KeymapDesc("Select from keymaps"))

-- extensions
vim.keymap.set("n", "<leader>pp", ts.extensions.project.project, KeymapDesc('Select project'))
vim.keymap.set("n", "<leader>ll", ":Telescope software-licenses find<CR>", KeymapDesc('Select License'))
