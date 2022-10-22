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

return packer.startup(function()
    -- Package Manager
    use("wbthomason/packer.nvim")

    -- autocomplete engine
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-omni")

    -- Config for nvim LSP
    use("neovim/nvim-lspconfig") 

end)
