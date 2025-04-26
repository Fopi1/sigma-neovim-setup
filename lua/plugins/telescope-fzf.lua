return {
	"nvim-telescope/telescope-fzf-native.nvim",
	build = "make",
	cond = vim.fn.executable("make") == 1,
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
