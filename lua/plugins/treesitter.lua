return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			ensure_installed = {
				"lua",
				"typescript",
				"html",
				"css",
				"javascript",
				"json",
				"tsx",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
		})
	end,
}
