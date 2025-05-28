return {

    -- Mason
    {
        "williamboman/mason.nvim",
          cmd = "Mason",               -- load on :Mason
         event = "BufReadPre",          config = function()
            require("mason").setup()
            opts = {
                ensure_installed = {
                    "clangd",
                    "clangformat",
                    "codelldb",
                },
            }
        end,
    },
    -- Mason LSPconfig
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls" },
            })
        end,
    },
    -- LSPconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local servers = { "pyright", "lua_ls", "ts_ls", "clangd" }
            lspconfig.emmet_language_server.setup({
                filetypes = {
                    "css",
                    "eruby",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "less",
                    "sass",
                    "scss",
                    "pug",
                    "typescriptreact",
                },
                -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                -- **Note:** only the options listed in the table are supported.
                init_options = {
                    ---@type table<string, string>
                    includeLanguages = {},
                    --- @type string[]
                    excludeLanguages = {},
                    --- @type string[]
                    extensionsPath = {},
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                    preferences = {},
                    --- @type boolean Defaults to `true`
                    showAbbreviationSuggestions = true,
                    --- @type "always" | "never" Defaults to `"always"`
                    showExpandedAbbreviation = "always",
                    --- @type boolean Defaults to `false`
                    showSuggestionsAsSnippets = false,
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                    syntaxProfiles = {},
                    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                    variables = {},
                },
            })
            local on_attach = function(_, _)
                vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, {desc = "Rename symbol"})
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code actions"})
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto defination"})
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation"})
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto reference "})
                vim.keymap.set("n", "gk", vim.lsp.buf.hover, {desc = "Symbol definition (LSP)"})

                vim.keymap.set("n", "<leader>q", function()
                    vim.diagnostic.setqflist()
                end, { desc = "Add diagnostics to quickfix list" })
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        end,
    },
    -- Additional LSP plugins can be added here
}
