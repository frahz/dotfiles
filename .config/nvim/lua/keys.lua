-- function wrapper for mapping custom keybinds
local map = function(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader keymap
vim.g.mapleader = " " -- space

-- keybinds for moving a line up or down
map("n", "<S-Up>", ":m-2<CR>")
map("n", "<S-Down>", ":m+<CR>")
map("i", "<S-Up>", "<Esc>:m-2<CR>")
map("i", "<S-Down>", "<Esc>:m+<CR>")

