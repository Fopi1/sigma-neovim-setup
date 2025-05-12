return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "npm install -g mcp-hub@latest",
	config = function()
		require("mcphub").setup({
			port = 37373,
			config = vim.fn.expand("~/.config/mcphub/servers.json"),

			auto_approve = true,

			extensions = {
				avante = {
					make_slash_commands = true,
				},
			},
		})
	end,
}
