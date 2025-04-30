local paths = require("fopi1.env.paths")
local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

keymap("n", "<leader>d", vim.diagnostic.open_float)
-- Tekescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Поиск файлов" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Глобальный поиск (grep)" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Буферы" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help-теги" })
-- NvimTree
keymap(
	"n",
	"<leader>ee",
	"<cmd>NvimTreeToggle<CR>",
	{ desc = "Показать дерево файлов", silent = true }
)
keymap("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Фокус дерева файлов", silent = true })
keymap("n", "<leader>er", function()
	require("nvim-tree.api").tree.change_root(vim.fn.expand("%:p:h"))
end, { desc = "Сделать root текущей папкой" })
-- Base mappings
keymap("n", "<C-h>", "<C-w>h", { desc = "Левый буфер", silent = true, noremap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Нижний буфер", silent = true, noremap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Верхний буфер", silent = true, noremap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Правый буфер", silent = true, noremap = true })
keymap("n", "<leader>nh", "<cmd>nohl<CR>")
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Сохранить файл", silent = true, noremap = true })
keymap("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
keymap("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
keymap("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
keymap("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
-- Tabs
keymap("n", "<leader>ts", "<cmd>tabs<CR>", { desc = "Показать все табы", silent = true, noremap = true })
keymap(
	"n",
	"<leader>tt",
	"<cmd>tabnew<CR>",
	{ desc = "Открыть новый таб", silent = true, noremap = true }
)
keymap("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Закрыть таб", silent = true, noremap = true })
keymap("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Следующий таб", silent = true, noremap = true })
keymap("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "Предыдущий таб", silent = true, noremap = true })
-- Terminal
keymap("t", "<C-c>", function()
	vim.api.nvim_chan_send(vim.b.terminal_job_id, "\x03")
end, { desc = "Прервать", noremap = true, silent = true })
keymap("t", "<C-q>", "<C-\\><C-n>", { desc = "Выйти из терминала", silent = true, noremap = true })

vim.api.nvim_create_user_command("MessagesBuf", function()
	local output = vim.api.nvim_exec("messages", true)
	vim.cmd("new")
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end, {})

vim.api.nvim_create_user_command("E", function(opts)
	local key = opts.args
	local path = paths[key]
	if path then
		vim.cmd("e " .. path)
	else
		print("Unknown alias: " .. key)
	end
end, { nargs = 1 })

vim.api.nvim_create_user_command("CD", function(opts)
	local key = opts.args
	local path = paths[key]
	if path then
		vim.cmd("cd " .. path)
	else
		print("Unknown alias: " .. key)
	end
end, { nargs = 1 })
