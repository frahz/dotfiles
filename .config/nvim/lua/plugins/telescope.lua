return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
            config = function()
                require("telescope").load_extension("fzf")
            end
        },
    },
    opts = {
        defaults = {
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.65,
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",

            }
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>",  mode = "n" },
        { "<leader>fg", "<cmd>Telescope git_files<CR>",   mode = "n" },
        { "<leader>fw", "<cmd>Telescope live_grep<CR>",   mode = "n" },
        { "<leader>fh", "<cmd>Telescope buffers<CR>",     mode = "n" },
        { "<leader>fs", "<cmd>Telescope grep_string<CR>", mode = "n" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>",    mode = "n" },
        { "<leader>fc", "<cmd>Telescope git_commits<CR>", mode = "n" },
        { "<leader>fd", "<cmd>Telescope diagnostics<CR>", mode = "n" },
        { "<leader>k",  "<cmd>Telescope keymaps<CR>",     mode = "n" }
    },
}
