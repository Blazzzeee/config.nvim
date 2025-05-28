return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim", 
        },
        config = function()
            -- Keymaps for Telescope
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "search file" })
            vim.keymap.set("n", "<leader>e", builtin.git_files, { desc = "search files (git)" })
            vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "live grep" })
            vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "help neovim" })
            vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "symbol picker (file)" })
            vim.keymap.set("n", "<leader>S", builtin.lsp_dynamic_workspace_symbols, { desc = "symbol picker (global)" })
            vim.keymap.set("n", "<leader>tm", builtin.man_pages, { desc = "Telescope browse man pages" })
            vim.keymap.set("n", "<leader>co", builtin.colorscheme, { desc = "Telescope change colorscheme " })
            vim.keymap.set("n", "<leader>tkb", builtin.keymaps, { desc = " Telescope show keymaps" })
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}), -- Theme settings for ui-select
                    },
                },
            })
            require("telescope").setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            preview_width = 0.6,
                            results_width = 0.4,
                        },
                        width = 0.8,
                    },
                },
            })

--            require("telescope").load_extension("ui-select")
        end,
    },
}
