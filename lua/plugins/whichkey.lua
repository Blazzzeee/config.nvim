return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		sort = { "local", "order", "group", "alphanum", "mod" },
		plugins = {
			presets = {
				operators = true,
				motions = false,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = false,
			},
		},
		preset = "helix",
		filter = function(mapping)
			return mapping.desc and mapping.desc ~= ""
		end,
	},
}
