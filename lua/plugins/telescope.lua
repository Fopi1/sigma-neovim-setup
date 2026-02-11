return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = { "VeryLazy" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local action_state = require("telescope.actions.state")
		return {
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
		}
	end,
}
