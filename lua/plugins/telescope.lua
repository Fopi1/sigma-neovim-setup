local action_state = require("telescope.actions.state")
return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			layout_config = { horizontal = { width = 0.9 } },
			mappings = {
				i = {
					["<C-x>"] = function(prompt_bufnr)
						local entry = action_state.get_selected_entry()
						vim.api.nvim_buf_delete(entry.bufnr, { force = true })
					end,
				},
				n = {
					["dd"] = function(prompt_bufnr)
						local entry = action_state.get_selected_entry()
						vim.api.nvim_buf_delete(entry.bufnr, { force = true })
					end,
				},
			},
		},
	},
}
