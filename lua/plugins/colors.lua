return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "auto",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false,   -- Force no bold
                no_underline = false, -- Force no underline
                styles = {         -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                function(colors)
                    return {
                        LineNr = { fg = colors.text },
                        CursorLineNr = { fg = colors.text },
                    }
                end,
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            -- setup must be called before loading
        end,
    },

    {
        "f4z3r/gruvbox-material.nvim",
        name = "gruvbox-material",
        lazy = true,
        priority = 1000,
        opts = {},
        config = function()
            -- values shown are defaults and will be used if not provided
            require("gruvbox-material").setup({
                italics = true, -- enable italics in general
                contrast = "medium", -- set contrast, can be any of "hard", "medium", "soft"
                comments = {
                    italics = true, -- enable italic comments
                },
                background = {
                    transparent = true, -- set the background to transparent
                },
                float = {
                    force_background = false, -- force background on floats even when background.transparent is set
                    background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
                    -- by the color scheme
                },
                signs = {
                    highlight = true, -- whether to highlight signs
                },
                customize = nil, -- customize the theme in any way you desire, see below what this
                -- configuration accepts
            })
        end,
    },
    {
        "gbprod/nord.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("nord").setup({})
            vim.cmd.colorscheme("nord")
        end,
    },
    install = {
        colorscheme = { "nord" },
    },
}
