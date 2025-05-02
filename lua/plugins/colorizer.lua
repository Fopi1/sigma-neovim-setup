return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre" },
	config = function()
		require("colorizer").setup({
			"javascript",
			"typescript",
			css = { css = true, css_fn = true },
			html = { names = false },
		})
	end,
}
