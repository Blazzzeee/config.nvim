return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	default_component_configs = {
		icon = {
			enabled = true, -- must be true to show icons
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
		},
	},
	opts = {
		close_if_last_window = true,
		open_files_in_last_window = true,
		filesystem = {
			follow_current_file = { enabled = true },
			window = {
				width = 35,
				position = "right",
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function(file_path)
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
