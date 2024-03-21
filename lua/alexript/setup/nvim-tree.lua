require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

local function nvimtreeOpen(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = nvimtreeOpen })

function nvimtreeWidthRatio(percentage)
	local ratio = percentage / 100
	local width = math.floor(vim.go.columns * ratio)
	return width
end


-- resize nvimtree if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
	callback = function()
		local width = nvimtreeWidthRatio(20)
		vim.cmd("tabdo NvimTreeResize " .. width)
	end,
})

local nvimtreeFocusOrToggle = function()
    local nvimTree = require("nvim-tree.api")
    local currentBuf = vim.api.nvim_get_current_buf()
    local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
    if currentBufFt == "NvimTree" then
        nvimTree.tree.toggle()
    else
        nvimTree.tree.focus()
    end
end
vim.keymap.set("n", "<leader>tt", nvimtreeFocusOrToggle, KeymapDesc('Toggle NvimTree'))
