local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    -- execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require("packer.util")

packer.init({
  package_root = packer_util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return packer.startup(function(use)
    -- Package Manager
    use("wbthomason/packer.nvim")

    -- autocomplete engine
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-omni")
    use("saadparwaiz1/cmp_luasnip")

    -- Config for nvim LSP
    use("neovim/nvim-lspconfig")

    -- Treesitter/Syntax Higlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim"}
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- snippet library

    -- Symbol Viewer
    use("stevearc/aerial.nvim")

    -- Better comment keybinds
    use("tpope/vim-commentary")

    -- Autopairs, works with cmp engine
    use("windwp/nvim-autopairs")

    -- Detect indentation style
    use({
        "nmac427/guess-indent.nvim",
        config = function ()
            require("guess-indent").setup({})
        end,
    })
    -- Statusline stuff
    use("kyazdani42/nvim-web-devicons")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    -- Theme
    use({
        "catppuccin/nvim",
        as = "catppuccin",
   })
end)
