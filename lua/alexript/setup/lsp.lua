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
    lspconfig.vls.setup({})
end

lua_ls_setup()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        "eslint",
        "lua_ls",
        "vls",
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
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
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
        vim.keymap.set("n", "gs", function()
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
