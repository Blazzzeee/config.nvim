return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim", -- Ensure this is installed as a dependency
        },
        config = function()
            -- Keymaps for Telescope
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope find git files" })
            vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = " Telescope diagnostics" })
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<leader>tm", builtin.man_pages, { desc = "Telescope browse man pages" })
            vim.keymap.set("n", "<leader>tc", builtin.colorscheme, { desc = "Telescope change colorscheme " })
            vim.keymap.set("n", "<leader>tkb", builtin.keymaps, { desc = " Telescope diagnostics" })
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

            require("telescope").load_extension("ui-select")
        end,
    },
}
