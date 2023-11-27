local utils = require('waseem.core.utils')
local nmap = utils.nmap


return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'folke/neodev.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
    },

    config = function()
        require('mason').setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
            },
        }


        local on_attach = function(client, bufnr)
            local lsp = vim.lsp
            if pcall(require, "telescope.builtin") then
                nmap({ 'gd', "<leader>ld" }, require('telescope.builtin').lsp_definitions, "go to Definitions")
                nmap({ 'gr', "<leader>lR" }, require('telescope.builtin').lsp_references, "go to References")
                nmap({ 'gT', "<leader>lT" }, require('telescope.builtin').lsp_type_definitions, "go to Type Definitions")
                nmap({ 'gI', "<leader>lI" }, require('telescope.builtin').lsp_implementations, "go to Implementations")
                nmap('<leader>lsw', require('telescope.builtin').lsp_workspace_symbols, "LSP Workspace Symbols")
                nmap('<leader>lsd', require('telescope.builtin').lsp_document_symbols, "LSP Document Symbols")
                nmap('<leader>led', function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end,
                    "LSP Document Diagnostics")
                nmap('<leader>lew', function() require('telescope.builtin').diagnostics() end,
                    "LSP Workspace Diagnostics")
            else
                nmap({ 'gd', "<leader>lD" }, lsp.buf.definition, "go to Definitions")
                nmap({ 'gr', "<leader>lR" }, lsp.buf.references, "go to References")
                nmap({ 'gT', "<leader>lT" }, lsp.buf.type_definition, "go to Type Definitions")
                nmap({ 'gI', "<leader>gI" }, lsp.buf.implmentation, "go to Implementations")
            end

            if pcall(require, "conform") then
                nmap("<leader>lf", "<cmd>Format<CR>", "Format Code")
            else
                nmap("<leader>lf", function() vim.lsp.buf.format { async = true } end, "LSP Format Code")
            end

            nmap("<leader>lE", vim.diagnostic.open_float, "LSP Show Diagnostic")
            nmap({ 'gD', "<leader>lD" }, lsp.buf.declaration, "go to Declaration")
            nmap({ 'K', "<leader>lK" }, lsp.buf.hover, "LSP Hover")
            nmap("<leader>la", lsp.buf.code_action, "LSP Code Actions")
            nmap("<leader>lr", lsp.buf.rename, "LSP Rename Symbol")
        end



        local lsp = require('lspconfig')
        -- local lsp_servers = {
        --     clangd = {},
        --     pyright = {
        --         settings = {
        --             pyright = {
        --                 autoImportCompletion = true,
        --             },
        --             python = {
        --                 analysis = {
        --                     -- autoSearchPaths = true,
        --                     -- diagnosticMode = 'openFilesOnly',
        --                     diagnosticMode = 'workspace',
        --                     -- unpackuseLibraryCodeForTypes = true,
        --                     -- typeCheckingMode = 'off',
        --                     useLibraryCodeForTypes = true,
        --                     -- diagnosticSeverityOverrides = {
        --                     --     reportGeneralTypeIssues = "none",
        --                     --     reportOptionalMemberAccess = "none",
        --                     --     reportOptionalSubscript = "none",
        --                     --     reportPrivateImportUsage = "none",
        --                     -- },
        --                 }
        --             }
        --         }
        --     },
        --     lua_ls = {
        --         settings = {
        --             Lua = {
        --                 diagnostics = {
        --                     globals = { 'vim' }
        --                 }
        --             }
        --         }
        --     },
        --     ruff_lsp = {},
        --     tailwindcss = {}
        -- }
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- for server, opts in pairs(lsp_servers) do
        --     lsp[server].setup(vim.tbl_deep_extend("force", opts, {
        --         on_attach = on_attach,
        --         capatabilities = capabilities,
        --     }))
        -- end
        --

        require('mason-lspconfig').setup_handlers {
            function(server_name)
                lsp[server_name].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end,

            ["lua_ls"] = function()
                lsp.lua_ls.setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            }
                        }
                    }
                }
            end,
            ["pyright"] = function()
                lsp.pyright.setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        pyright = {
                            autoImportCompletion = true,
                        },
                        python = {
                            analysis = {
                                -- autoSearchPaths = true,
                                -- diagnosticMode = 'openFilesOnly',
                                diagnosticMode = 'workspace',
                                -- unpackuseLibraryCodeForTypes = true,
                                typeCheckingMode = 'off',
                                useLibraryCodeForTypes = true,
                                diagnosticSeverityOverrides = {
                                    reportGeneralTypeIssues = "none",
                                    reportOptionalMemberAccess = "none",
                                    reportOptionalSubscript = "none",
                                    reportPrivateImportUsage = "none",
                                },
                            }
                        }
                    }
                }
            end,
            -- ['jedi_language_server'] = function()
            --     lsp.jedi_language_server.setup {
            --         on_attach = on_attach,
            --         capabilities = capabilities,
            --         -- init_options = {
            --         --     completion = {
            --         --         disableSnippets = true,
            --         --     },
            --         -- }
            --     }
            -- end,
            ['ruff_lsp'] = function()
                lsp.ruff_lsp.setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    init_options = {
                        settings = {
                            args = {
                                -- "--extend-select=W,COM,ICN,I,",
                                -- "--ignore=E501,E722,COM812",
                            },
                        },
                    },

                }
            end

        }
    end
}
