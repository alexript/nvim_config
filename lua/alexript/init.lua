vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local currenthome = vim.fn.expand('$HOME'):gsub("\\", "/") --os.getenv('HOME')

vim.opt.shell = 'nu --env-config ' .. currenthome .. '/.config/nushell/env.nu --config ' .. currenthome .. '/.config/nushell/config.nu'

require("alexript.set")
require("alexript.remap")
require("alexript.lazy")

vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
]])

local fidget = require("fidget")

--- notify via fidget
---@param text text to be notifies
function Notify(text)
    fidget.notify(text, nil, { annote = "MY NOTE", key = "foobar" })
end
