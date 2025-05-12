return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre" },
	opts = {
		"javascript",
		"typescript",
		css = { css = true, css_fn = true },
		html = { names = false },
	},
}
