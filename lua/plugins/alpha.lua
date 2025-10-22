return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                     ]],
			[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
			[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
			[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
			[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
			[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
			[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
			[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
			[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
			[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
			[[                                 ░                   ]],
			[[                                                     ]],
		}
		dashboard.section.header.opts.hl = "Keyword"

		-- Custom menu section with borders (static text)
		local menu = {
			type = "text",
			val = {
				"╔═════════════════════════════════════════════════╗",
				"║   > Settings                                s  ║",
				"║   > Load Session                            l  ║",
				"║   > Quit NVIM                               q  ║",
				"╚═════════════════════════════════════════════════╝",
			},
			opts = {
				position = "center",
				hl = "Function",
			},
		}

		-- Footer
		dashboard.section.footer.val = {
			"▄████▄   ██░ ██  ▒█████   ▒█████    ██████ ▓█████ ",
			"▒██▀ ▀█  ▓██░ ██▒▒██▒  ██▒▒██▒  ██▒▒██    ▒ ▓█   ▀ ",
			"▒▓█    ▄ ▒██▀▀██░▒██░  ██▒▒██░  ██▒░ ▓██▄   ▒███   ",
			"▒▓▓▄ ▄██▒░▓█ ░██ ▒██   ██░▒██   ██░  ▒   ██▒▒▓█  ▄ ",
			"▒ ▓███▀ ░░▓█▒░██▓░ ████▓▒░░ ████▓▒░▒██████▒▒░▒████▒",
			"░ ░▒ ▒  ░ ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░░░ ▒░ ░",
			"  ░  ▒    ▒ ░▒░ ░  ░ ▒ ▒░   ░ ▒ ▒░ ░ ░▒  ░ ░ ░ ░  ░",
			"░         ░  ░░ ░░ ░ ░ ▒  ░ ░ ░ ▒  ░  ░  ░     ░   ",
			"░ ░       ░  ░  ░    ░ ░      ░ ░        ░     ░  ░",
			"░                                                  ",
		}
		dashboard.section.footer.opts.hl = "Keyword"

		dashboard.config.layout = {
			{ type = "padding", val = 5 },
			dashboard.section.header,
			{ type = "padding", val = 5 },
			menu,
			{ type = "padding", val = 5 },
			dashboard.section.footer,
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Set keymaps on AlphaReady event
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			desc = "Set dashboard keymaps",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "s", "<cmd> e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>", opts)
				vim.keymap.set("n", "l", "<cmd>SessionManager load_session<CR>", opts)
				vim.keymap.set("n", "q", "<cmd>qa<CR>", opts)
			end,
		})
	end,
}
