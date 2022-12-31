local ok, _ = pcall(require, "impatient")
if not ok then
    vim.notify("Warning: impatient.nvim not installed", vim.log.levels.WARN)
end

require("frahz.plugins")
require("frahz.options")
require("frahz.keys")
require("frahz.theme")
require("frahz.lsp")
require("frahz.statusline")
require("frahz.completion")
require("frahz.treesitter")
require("frahz.autopairs")
require("frahz.gitsigns")
require("frahz.tags")
require("frahz.telescope")
require("frahz.alpha")
