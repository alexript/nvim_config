local toggler = require('nvim-toggler')
toggler.setup({
    -- your own inverses
    inverses = {
        ["vim"] = "emacs",
    },
    -- removes the default <leader>i keymap
    remove_default_keybinds = true,
    -- removes the default set of inverses
    remove_default_inverses = false,
})


vim.keymap.set({ "n", "v" }, "<leader>cl", toggler.toggle, KeymapDesc("Toggle symbol under cursor to opposite"))
