return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	keys = {
		{
			"<leader>a+",
			function()
				local tree_ext = require("avante.extensions.nvim_tree")
				tree_ext.add_file()
			end,
			desc = "Select file in NvimTree",
			ft = "NvimTree",
		},
		{
			"<leader>a-",
			function()
				local tree_ext = require("avante.extensions.nvim_tree")
				tree_ext.remove_file()
			end,
			desc = "Deselect file in NvimTree",
			ft = "NvimTree",
		},
	},
	config = function()
		require("avante").setup({
			provider = "mistralai",
			cursor_applying_provider = "mistralai",
			behaviour = {
				enable_cursor_planning_mode = true,
			},
			vendors = {
				["mistralai"] = {
					__inherited_from = "openai",
					endpoint = "https://openrouter.ai/api/v1",
					model = "mistralai/mistral-7b-instruct:free",
					api_key_name = "OPENROUTER_AI_API_KEY",
					disable_tools = false,
				},
				["qwen3-235b"] = {
					__inherited_from = "openai",
					endpoint = "https://openrouter.ai/api/v1",
					model = "qwen/qwen3-235b-a22b:free",
					api_key_name = "OPENROUTER_AI_API_KEY",
					timeout = 60000,
					disable_tools = true,
				},
			},
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub:get_active_servers_prompt()
			end,

			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,

			disabled_tools = {
				"list_files",
				"search_files",
				"read_file",
				"create_file",
				"rename_file",
				"delete_file",
				"create_dir",
				"rename_dir",
				"delete_dir",
				"bash",
			},
			selector = {
				exclude_auto_select = { "NvimTree" },
			},
		})
	end,
	build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
