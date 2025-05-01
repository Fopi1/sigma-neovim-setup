return {
	{
		"utilyre/sentiment.nvim",
		version = "*",
		event = { "BufReadPost" },
		opts = {
			---@type tuple<string, string>[]
			pairs = {
				{ "(", ")" },
				{ "{", "}" },
				{ "[", "]" },
			},
		},
	},
}
