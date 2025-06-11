return {
	"williamboman/mason.nvim",
	event = { "VeryLazy" },
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		require("mason-lspconfig").setup({
			ensure_installed = { "angularls" },
			automatic_enable = {
				exclude = { "lua_ls" },
			},
		})
	end,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}
