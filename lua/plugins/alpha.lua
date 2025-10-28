return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local plugins_count = #require("lazy").plugins()
		--- @type { key: string, command: string, icon: string, label: string }[]
		local keymaps = {
			{
				key = "s",
				command = "<cmd> e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>",
				icon = "",
				label = "Settings",
			},
			{ key = "e", command = "<cmd>e<CR>", icon = "", label = "New File" },
			{ key = "l", command = "<cmd>SessionManager load_session<CR>", icon = "", label = "Load Session" },
			{ key = "f", command = "<cmd>Telescope find_files<CR>", icon = "", label = "Find File" },
			{ key = "q", command = "<cmd>qa<CR>", icon = "", label = "Quit NVIM" },
		}

		local primary_color = "Keyword" -- Purple on onedark theme
		local secondary_color = "Function" -- Blue on onedark theme

		local generate_menu = function()
			local menu = {}
			local menu_length = 50
			for i, value in ipairs(keymaps) do
				if i == 1 then
					menu[#menu + 1] = "╔" .. string.rep("═", menu_length - 2) .. "╗"
				end
				local label_part = "║  " .. value.icon .. " > " .. value.label
				local key_part = value.key .. "  ║"
				local text_width = vim.fn.strdisplaywidth(label_part) + vim.fn.strdisplaywidth(key_part)
				local spaces_needed = menu_length - text_width

				menu[#menu + 1] = "║  "
					.. value.icon
					.. " > "
					.. value.label
					.. string.rep(" ", spaces_needed)
					.. value.key
					.. "  ║"

				if i == #keymaps then
					menu[#menu + 1] = "╚" .. string.rep("═", menu_length - 2) .. "╝"
				end
			end
			return menu
		end

		-- ==================================================================================================================================================================
		-- Layout
		-- ==================================================================================================================================================================
		local header = {
			type = "text",
			val = {
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
			},
			opts = {
				position = "center",
				hl = primary_color,
			},
		}

		-- Custom menu section with borders (static text)
		local menu = {
			type = "text",
			val = generate_menu(),
			opts = {
				position = "center",
				hl = secondary_color,
			},
		}

		-- Footer
		local footer = {
			type = "text",
			val = {
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
			},
			opts = {
				position = "center",
				hl = primary_color,
			},
		}

		local quote = {
			type = "text",
			val = {
				" - If it's not fun, you are not doing it right -",
			},
			opts = {
				position = "center",
				hl = "Type",
			},
		}
		local total_plugins = {
			type = "text",
			val = {
				"Total plugins: " .. plugins_count,
			},
			opts = { position = "center", hl = "Type" },
		}

		dashboard.config.layout = {
			{ type = "padding", val = 5 },
			header,
			{ type = "padding", val = 5 },
			menu,
			{ type = "padding", val = 5 },
			footer,
			{ type = "padding", val = 5 },
			quote,
			total_plugins,
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Set keymaps on AlphaReady event
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			desc = "Set dashboard keymaps",
			callback = function()
				local alpha_buffer = vim.api.nvim_get_current_buf()
				local opts = { noremap = true, silent = true, buffer = alpha_buffer }
				for _, value in ipairs(keymaps) do
					vim.keymap.set("n", value.key, value.command, opts)
				end
			end,
		})
	end,
}
