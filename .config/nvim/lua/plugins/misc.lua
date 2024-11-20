return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "▏" },
            exclude = {
                filetypes = {
                    "alpha", "help", "terminal", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults"
                },
            },
        }
    },
    {
        "nmac427/guess-indent.nvim",
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        opts = {}
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
            },
            format_after_save = {
                lsp_format = "fallback",
            },
        },
    },
    {
        "MaximilianLloyd/tw-values.nvim",
        keys = {
            {
                "gK",
                "<cmd>TWValues<cr>",
                desc = "Show tailwind CSS values",
            },
        },
        opts = {
            border = "rounded",
            show_unknown_classes = true,
            focus_preview = true,
        },
    },
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 5,
            },
        },
        keys = {
            { "<leader>o", ":lua require('oil').open_float()<CR>", desc = "Open Oil Floating Window", silent = true },
        },
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
}
