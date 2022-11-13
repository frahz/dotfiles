-- function wrapper for mapping custom keybinds
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader keymap
vim.g.mapleader = " " -- space

-- keybinds for moving a line up or down
map("n", "<S-Up>", "<cmd>m-2<CR>")
map("n", "<S-Down>", "<cmd>m+<CR>")
map("i", "<S-Up>", "<Esc><cmd>m-2<CR>")
map("i", "<S-Down>", "<Esc><cmd>m+<CR>")

-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fg", "<cmd>Telescope git_files<CR>")
map("n", "<Leader>fw", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>fh", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<Leader>fc", "<cmd>Telescope git_commits<CR>")
map("n", "<Leader>fd", "<cmd>Telescope diagnostics<CR>")
