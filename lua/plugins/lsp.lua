return {
	"neovim/nvim-lspconfig",
	event = { "VeryLazy" },
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					},
				},
			},
		}
		local function on_attach(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end
		for name, opts in pairs(servers) do
			lspconfig[name].setup(vim.tbl_deep_extend("force", {
				capabilities = capabilities,
				on_attach = on_attach,
			}, opts))
		end
	end,
}
