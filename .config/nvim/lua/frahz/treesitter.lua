local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "python",
        "lua",
        "rust",
        "cpp",
        "c"
    },
    highlight = {
        enable = true,
        -- disable = { "c" },
    }
})
