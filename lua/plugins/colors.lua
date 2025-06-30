return {
    {
        "zenbones-theme/zenbones.nvim",
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = true,
        priority = 1000,
        config = function()
            require('nordic').load()
        end
    },

    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
            })
        end
    },
}
