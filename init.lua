local vim = vim

-- vim.opt.winborder = "rounded"
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

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>r", ":update<CR> :source<CR>")

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	-- { src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/Saghen/blink.cmp" },
})

require "mini.pick".setup()
-- require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "javascript", "typescript", "python", "c" },
	highlight = { enable = true }
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
-- vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

require("blink-cmp").setup({
	keymap = { preset = "default" },
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

