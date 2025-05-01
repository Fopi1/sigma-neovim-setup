return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		disable_netrw = true,
		view = {
			width = 35,
			side = "left",
			preserve_window_proportions = true,
			number = true,
			relativenumber = true,
		},
		filters = {
			dotfiles = true,
			custom = { "node_modules" },
			exclude = { ".env", ".env.local" },
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 500,
		},
		update_focused_file = { enable = true, update_root = true },
		sync_root_with_cwd = true,
		renderer = {
			indent_width = 1,
			icons = {
				show = {
					hidden = true,
				},
			},
		},
	},
}
