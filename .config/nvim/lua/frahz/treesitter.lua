local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "python",
        "lua",
        "rust",
        "cpp",
        "c",
        "bash",
        "java"
    },
    highlight = {
        enable = true,
        -- disable = { "c" },
    }
})
