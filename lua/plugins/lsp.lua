return {
    -- Mason
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        config = function()
            require("mason").setup()
            -- Optional non-LSP tools (already installed here)
            local mason_registry = require("mason-registry")
            local ensure_installed = {
                "clangd",
            }
            for _, tool in ipairs(ensure_installed) do
                local p = mason_registry.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },

    -- Mason LSPconfig + all LSP setup logic
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = true,
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls", "clangd" },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "hrsh7th/cmp-nvim-lsp", "mason-org/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local telescope = require("telescope.builtin")
            local servers = { "clangd", "lua_ls", "pyright" }

            local on_attach = function(_, _)
                vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename symbol" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
                vim.keymap.set("n", "gi", telescope.lsp_implementations, { desc = "Goto implementation" })
                vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "Goto references" })
                vim.keymap.set("n", "gk", vim.lsp.buf.hover, { desc = "Symbol info" })
                vim.keymap.set("n", "<leader>q", function()
                    vim.diagnostic.setqflist()
                end, { desc = "Diagnostics to quickfix list" })
            end

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {},
                })
            end

            -- Manual setup for Emmet LSP (not managed by Mason)
            lspconfig.emmet_language_server.setup({
                filetypes = {
                    "css", "eruby", "html", "javascript", "javascriptreact",
                    "less", "sass", "scss", "pug", "typescriptreact",
                },
                init_options = {
                    includeLanguages = {},
                    excludeLanguages = {},
                    extensionsPath = {},
                    preferences = {},
                    showAbbreviationSuggestions = true,
                    showExpandedAbbreviation = "always",
                    showSuggestionsAsSnippets = false,
                    syntaxProfiles = {},
                    variables = {},
                },
            })
        end,
    },
}
