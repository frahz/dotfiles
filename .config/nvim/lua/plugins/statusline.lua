local function shiftwidth()
    return "󰌒  " .. vim.api.nvim_get_option_value("shiftwidth", {})
end

local theme = {
    normal = {
        a = { bg = "#1e1e2e", fg = "#cdd6f4" },
        b = { bg = "#1e1e2e", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#cdd6f4" },
    },
    inactive = {
        a = { bg = "#1e1e2e", fg = "#cdd6f4" },
        b = { bg = "#1e1e2e", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#cdd6f4" },
    },
}

vim.opt.fillchars = {
    stl = "─",
    stlnc = "─",
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = theme,
            section_separators = { left = "──", right = "──" },
            component_separators = { left = "──", right = "──" },
            padding = 0,
        },
        sections = {
            lualine_a = {},
            lualine_b = {
                {
                    "mode",
                    padding = 1,
                },
                {
                    "branch",
                    icon = { "", color = { fg = "#b4befe" } },
                    padding = 1,
                },
                {
                    "diff",
                    padding = 1,
                },
                {
                    "diagnostics",
                    padding = 1,
                },
                {
                    "progress",
                    padding = 1,
                },
            },
            lualine_c = {
                "%=",
                {
                    "filetype",
                    colored = false,
                    icon_only = true,
                    separator = "∙",
                    padding = 1,
                },
                {
                    "filename",
                    file_status = true,
                    newfile_status = false,
                    path = 4,
                    padding = 1,
                },
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    shiftwidth,
                    padding = 1,
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    },
}
