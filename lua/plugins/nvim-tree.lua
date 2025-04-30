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
			git_clean = false,
			no_buffer = false,
			custom = { "node_modules", ".git" },
			exclude = { ".env", ".env.local" },
		},
		git = {
			enable = true,
			ignore = false,
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
