return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
        vim.api.nvim_command("colorscheme catppuccin")
    end,
    opts = {
        flavour = "mocha",
        no_italic = true,
        integrations = {
            treesitter = true,
            cmp = true,
            mason = true,
        }

    },
}
