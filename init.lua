local vim = vim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>r", ":update<CR> :source<CR>")

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua"},
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://www.github.com/windwp/nvim-autopairs" },
})

require "oil".setup()
require "fzf-lua".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "javascript", "typescript", "python", "c" },
	highlight = { enable = true }
})
require("nvim-autopairs").setup({
    check_ts = true,
    fast_wrap = {},
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>f", ":lua require('fzf-lua').files()<CR>")
vim.keymap.set("n", "<leader>/", ":lua require('fzf-lua').live_grep()<CR>")
vim.keymap.set("n", "<leader>h", ":lua require('fzf-lua').helptags()<CR>")
vim.keymap.set("n", "<leader>s", ":lua require('fzf-lua').resume()<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

require("blink-cmp").setup({
keymap = {
    -- preset = "default",
    -- ["<Tab>"] = { "select_next", "fallback" },
    -- ["<S-Tab>"] = { "select_prev", "fallback" },
    -- ["<CR>"] = { "accept", "fallback" },
  },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = {
				min_keyword_length = 3,
				max_items = 3,
			},
			path = {
				max_items = 3,
				min_keyword_length = 3,
			},
			buffer = {
				min_keyword_length = 3,
				max_items = 3,
			},
			snippets = {
				min_keyword_length = 3,
			},
		},
	},
	completion = {
				keyword= {range = 'prefix'},
        accept = { auto_brackets = { enabled = false }, },
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind" },
				},
			},
		},
	}
})

vim.cmd("colorscheme vague")
-- vim.cmd("hi statusline guibg=NONE")

vim.lsp.enable({ "lua_ls", "pyright", "clangd", "rubocop" })
vim.opt.winborder = "none"
