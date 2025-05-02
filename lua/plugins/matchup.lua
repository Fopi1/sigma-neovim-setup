---@diagnostic disable
return {
	"andymass/vim-matchup",
	event = { "BufReadPre" },
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
		require("nvim-treesitter.configs").setup({
			matchup = {
				enable = true,
				include_match_words = true,
			},
		})
	end,
}
