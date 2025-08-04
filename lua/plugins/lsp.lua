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
			pyright = {
				root_dir = require("lspconfig.util").root_pattern("pyrightconfig.json", ".git"),
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
			jsonls = {},
			asm_lsp = {
				cmd = { "asm-lsp" },
				filetypes = { "asm", "S", "s" },
				root_dir = require("lspconfig.util").root_pattern("*.asm", "Makefile"),
				settings = {
					asm = {
						assembler = "nasm",
						instruction_se = { "x86/x86-64" },
					}
				}
			},
			tailwindcss = {},
			ts_ls = {},
			emmet_ls = {
				filetypes = {},
				on_new_config = function(config, root_dir)
					local util = require("lspconfig.util")
					if util.root_pattern("angular.json")(root_dir) then
						config.filetypes = {
							"html",
							"css",
							"scss",
							"typescriptreact",
							"javascriptreact",
						}
					else
						config.filetypes = {
							"html",
							"css",
							"scss",
						}
					end
				end,
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
