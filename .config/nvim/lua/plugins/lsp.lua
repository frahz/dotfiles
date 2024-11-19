local on_attach = function(event)
    -- Don't know what this does ??
    -- require("cmp").on_attach(client)
    local bufopts = { noremap = true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = true,
            },
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                opts = {},
            },
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local diagnostics_config = {
                virtual_text = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "●",
                        [vim.diagnostic.severity.WARN] = "●",
                        [vim.diagnostic.severity.INFO] = "●",
                        [vim.diagnostic.severity.HINT] = "●",
                    },
                },
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }
            vim.diagnostic.config(diagnostics_config)

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = on_attach,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local servers = {
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            imports = {
                                granularity = {
                                    group = "module",
                                },
                            },
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            files = {
                                excludeDirs = { ".direnv" },
                            },
                            procMacro = {
                                enable = true
                            },
                        },
                    },
                },
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--pch-storage=memory",
                        "--clang-tidy",
                        "--suggest-missing-includes",
                        "--all-scopes-completion",
                    }
                },
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = {},
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                nil_ls = {
                    auto_start = true,
                    settings = {
                        ['nil'] = {
                            formatting = {
                                command = { "alejandra" },
                            },
                            nix = {
                                maxMemoryMB = 8196,
                                flake = {
                                    autoArchive = false,
                                    autoEvalInputs = true,
                                },
                            }
                        }
                    }
                },
                bashls = {},
                pyright = {},
                ts_ls = {},
                gopls = {},
                html = {},
                htmx = {},
                cssls = {},
                tailwindcss = {},
                eslint = {},
                svelte = {},
            }

            require("mason").setup()
            local ensure_installed = vim.tbl_keys(servers or {})
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end
                }
            })
        end
    },
}
