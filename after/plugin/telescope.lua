local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- project files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})       -- git files
vim.keymap.set('n', '<leader>ps', function()              -- project search
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})

