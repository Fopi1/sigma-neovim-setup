return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		view = { width = 30, side = "left", preserve_window_proportions = true },
		update_focused_file = { enable = true, update_root = true },
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		renderer = {
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
			},
		},
	},
}
