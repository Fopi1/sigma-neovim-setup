return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = { horizontal = { width = 0.9 } },
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},
		})
	end,
}
