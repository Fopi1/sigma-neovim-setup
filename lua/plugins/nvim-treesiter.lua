return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = { "lua", "typescript", "html", "css", "javascript", "json" },
		auto_install = true,
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	},
}
