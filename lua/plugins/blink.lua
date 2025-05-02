return {
	"saghen/blink.cmp",
	event = { "BufReadPre" },
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
			list = {
				selection = { auto_insert = false },
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
						{ "source_name" },
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
