return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        show_guides = true,
        guides = {
            -- When the child item has a sibling below it
            mid_item = "├─",
            -- When the child item is the last in the list
            last_item = "└─",
            -- When there are nested child guides to the right
            nested_top = "│ ",
            -- Raw indentation
            whitespace = "  ",
        },
    },
    keys = {
        { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "[A]erial toggle",    mode = "n" },
        { "{",         "<cmd>AerialPrev<CR>",    desc = "prev aerial symbol", mode = { "n", "v" } },
        { "}",         "<cmd>AerialNext<CR>",    desc = "next aerial symbol", mode = { "n", "v" } },
    },
}
