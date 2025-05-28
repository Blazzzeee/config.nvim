return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>b",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			-- Add more filetypes if needed
		},
		default_format_opts = {
			lsp_format = "fallback", -- Use LSP if no formatter found
		},
	},
	init = function()
		-- Set formatexpr to use conform
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
