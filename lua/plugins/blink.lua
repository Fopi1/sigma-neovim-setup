return {
	"saghen/blink.cmp",
	event = { "BufReadPost" },
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	---@module "blink-cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default", ["<Tab>"] = { "select_and_accept" }, ["<C-l>"] = { "show" } },
		appearance = {
			nerd_font_variant = "normal",
		},
		completion = {
			documentation = { treesitter_highlighting = true },
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}
