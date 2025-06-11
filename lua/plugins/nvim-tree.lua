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
			dotfiles = false,
			custom = { "node_modules" },
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 1000,
		},
		update_focused_file = { enable = true, update_root = true },
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		renderer = {
			indent_width = 1,
			icons = {
				web_devicons = {
					file = {
						enable = true,
						color = true,
					},
					folder = {
						enable = true,
						color = true,
					},
				},
				show = {
					hidden = true,
				},
			},
		},
	},
}
