local paths = require("fopi1.env.paths")
local keymap = vim.keymap.set

keymap("n", "<leader>d", vim.diagnostic.open_float)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Поиск файлов" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Глобальный поиск (grep)" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Буферы" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help-теги" })
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

vim.api.nvim_create_user_command("E", function(opts)
	local key = opts.args
	local path = paths[key]
	if path then
		vim.cmd("e " .. path)
	else
		print("Unknown alias: " .. key)
	end
end, { nargs = 1 })
