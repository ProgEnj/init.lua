return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {

            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ["omnisharp"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        cmd = {
                          "omnisharp",
                          "--languageserver",
                        },
                        settings = {
                          RoslynExtensionsOptions = {
                            enableDecompilationSupport = false,
                            enableImportCompletion = true,
                            enableAnalyzersSupport = true,
                          }
                        },
                        root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj")
                    }
                end
            }
        })
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.omnisharp.setup {
            capabilities = capabilities,
            cmd = {
                "omnisharp",
                "--languageserver",
            },
            enable_import_completion = true,
            organize_imports_on_formats = true,
            enable_roslyn_analyzers = true,
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
        }
    end
}
