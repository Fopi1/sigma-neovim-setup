return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		indent = { enable = true },
		ensure_installed = { "lua", "typescript", "html", "css", "javascript", "json", "tsx" },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
