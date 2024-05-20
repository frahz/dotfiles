local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local bootstrap = false

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    bootstrap = true
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
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
    use({
        "j-hui/fidget.nvim",
        config = function ()
            require("fidget").setup({})
        end
    })

    -- Treesitter/Syntax Higlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function ()
            local ts_update = require("nvim-treesitter.install").update({with_sync = true})
            ts_update()
        end,
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

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
          require("ibl").setup({
              indent = { char = "▏" },
              exclude = {
                filetypes = {
                  "alpha", "help", "terminal", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults"
                },
              },
          })
        end,
    })

    -- LSP Servers manager
    use({
        "williamboman/mason.nvim",
        run = ":MasonUpdate"
    })
    use("williamboman/mason-lspconfig.nvim")

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

    -- Git support
    use("lewis6991/gitsigns.nvim")

    -- Nicer looking netrw
    use({
        "prichrd/netrw.nvim",
        config = function ()
            require("netrw").setup({})
        end
    })

    -- Greeter
    use("goolord/alpha-nvim")

    use({
        "ojroques/nvim-osc52",
        config = function ()
            require("osc52").setup({silent = true})
        end
    })

    -- Theme
    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })

    -- Improve startuptime
    use("lewis6991/impatient.nvim")

    if bootstrap then
        require("packer").sync()
    end

end)
