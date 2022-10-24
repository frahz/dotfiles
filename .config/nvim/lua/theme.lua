local catppuccin = require("catppuccin");

catppuccin.setup({
    flavour = "mocha",
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        treesitter = true,
        cmp = true,
    }
})
vim.api.nvim_command("colorscheme catppuccin")
