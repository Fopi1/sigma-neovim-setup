require("fopi1")
require("config.lazy")
-- Lazy plugins
require("lazy").setup({
	{ "neovim/nvim-lspconfig" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
})

local cmp = require("cmp")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"emmet_ls",
		"jsonls",
		"lua_ls",
		"prismals",
	},
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({
	capabilities = lsp_capabilities,
})
lspconfig.lua_ls.setup({
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.emmet_ls.setup({
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescriptreact",
	},
	init_options = {
		html = {
			["bem.enabled"] = true,
		},
	},
})

lspconfig.html.setup({
	capabilities = lsp_capabilities,
})

