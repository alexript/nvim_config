-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types = true,   -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
    -- for your Neovim config directory, the config.library settings will be used as is
    -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
    -- for any other directory, config.library.enabled will be set to false
    override = function(root_dir, options) end,
    -- With lspconfig, Neodev will automatically setup your lua-language-server
    -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
    -- in your lsp start options
    lspconfig = true,
    -- much faster, but needs a recent built of lua-language-server
    -- needs lua-language-server >= 3.6.0
    pathStrict = true,
})
require("neoconf").setup({
    -- name of the local settings files
    local_settings = ".neoconf.json",
    -- name of the global settings file in your Neovim config directory
    global_settings = "neoconf.json",
    -- import existing settings from other plugins
    import = {
        vscode = true, -- local .vscode/settings.json
        coc = true,    -- global/local coc-settings.json
        nlsp = true,   -- global/local nlsp-settings.nvim json settings
    },
    -- send new configuration to lsp clients when changing json settings
    live_reload = true,
    -- set the filetype to jsonc for settings files, so you can use comments
    -- make sure you have the jsonc treesitter parser installed!
    filetype_jsonc = true,
    plugins = {
        -- configures lsp clients with settings in the following order:
        -- - lua settings passed in lspconfig setup
        -- - global json settings
        -- - local json settings
        lspconfig = {
            enabled = true,
        },
        -- configures jsonls to get completion in .nvim.settings.json files
        jsonls = {
            enabled = true,
            -- only show completion in json settings for configured lsp servers
            configured_servers_only = true,
        },
        -- configures lua_ls to get completion of lspconfig server settings
        lua_ls = {
            -- by default, lua_ls annotations are only enabled in your neovim config directory
            enabled_for_neovim_config = true,
            -- explicitely enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
            enabled = false,
        },
    },
})
-- Setup nvim-java before lspconfig
require('java').setup()

local lsp_zero = require('lsp-zero')
local lspconfig = require("lspconfig")

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
    },
})

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.setup()

local function lua_ls_setup()
    lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
end

lua_ls_setup()
lspconfig.vls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.jdtls.setup({})
-- lspconfig.jdtls.setup({
--     settings = {
--         java = {
--             configuration = {
--                 runtimes = {
--                     {
--                         name = "GraalVM-ce-21",
--                         path = "C:/Java/graalvm-community-openjdk-21.0.1+12.1",
--                         default = true,
--                     }
--                 }
--             }
--         }
--     }
-- })
--
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "eslint",
        "lua_ls",
        'rust_analyzer',
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = lua_ls_setup,
    }
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = true }

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, KeymapDesc("Go to definition", opts))
        vim.keymap.set("n", "K", function()
            --            vim.lsp.buf.hover()
            require('pretty_hover').hover()
        end, KeymapDesc("Hover info about the symbol under cursor", opts))
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)

        vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
        end, opts)
        vim.keymap.set("n", "gi", function()
            vim.lsp.buf.implementation()
        end, opts)
        vim.keymap.set("n", "go", function()
            vim.lsp.buf.type_definition()
        end, opts)
        vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "gh", function()
            vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "<F2>", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "<F4>", function()
            vim.lsp.buf.code_action()
        end, opts)

        vim.keymap.set("n", "gl", function()
            vim.diagnostic.open_float()
        end, opts)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
})


vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "muttrc*", "neomuttrc" },
    callback = function()
        vim.lsp.start({
            name = "mutt",
            cmd = { "mutt-language-server" }
        })
    end,
})
