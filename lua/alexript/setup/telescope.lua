local ts_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", ts_builtin.find_files, {}) -- project files
vim.keymap.set("n", "<C-p>", ts_builtin.git_files, {})       -- git files
vim.keymap.set("n", "<leader>bb", ts_builtin.buffers, {})
vim.keymap.set("n", "<leader>bi", ts_builtin.builtin, {})
vim.keymap.set("n", "<leader>fh", ts_builtin.help_tags, {})
vim.keymap.set("n", "<leader>ps", ts_builtin.live_grep, {})
vim.keymap.set("n", "<leader>hk", ts_builtin.keymaps, {})
