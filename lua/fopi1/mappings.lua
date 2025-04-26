local paths = require("fopi1.env.paths")
local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

keymap("n", "<leader>d", vim.diagnostic.open_float)
-- Tekescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Поиск файлов" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Глобальный поиск (grep)" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Буферы" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help-теги" })
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
-- Base mappings
keymap("n", "<C-h>", "<C-w>h", { desc = "Левый буфер", silent = true, noremap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Нижний буфер", silent = true, noremap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Верхний буфер", silent = true, noremap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Правый буфер", silent = true, noremap = true })

vim.api.nvim_create_user_command("E", function(opts)
	local key = opts.args
	local path = paths[key]
	if path then
		vim.cmd("e " .. path)
	else
		print("Unknown alias: " .. key)
	end
end, { nargs = 1 })
