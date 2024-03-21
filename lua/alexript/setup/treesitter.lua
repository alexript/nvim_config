tsinstall = require("nvim-treesitter.install")
tsinstall.compilers = { "cl", "clang", "zig", "gcc" }
tsinstall.prefer_git = true
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "markdown",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "rust",
        "lua",
        "vim",
        "query",
        "javascript",
        "typescript",
        "go",
        "java",
        "css",
        "html",
        "diff",
        "gitcommit",
        "git_rebase",
        "gitattributes",
        "gitignore",
        "http",
        "json",
    },
    sync_install = false,
    auto_install = true,
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    --    rainbow = {
    --        enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    --        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
    --    },
})
