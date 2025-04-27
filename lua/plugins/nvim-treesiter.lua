return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = { "lua", "typescript", "html", "css", "javascript", "json" },
		auto_install = true,
	},
}
