-- [[ options.lua ]]
local opt = vim.opt

-- [[ context ]]
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8

-- [[ whitespace ]]
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- [[ search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- [[ misc ]]
opt.swapfile = false

-- [[ indent ]]
opt.list = true
opt.listchars = {
    lead = "⋅",
    tab = "│ ",
    trail = "•",
}
