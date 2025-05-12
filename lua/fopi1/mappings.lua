local safeRequire = require("functions.safeRequire")

local paths = safeRequire("fopi1.env.paths")
local userCommandsLabels = { "CD", "LCD", "E" }
local keymap = vim.keymap.set
local function is_dir(path)
	return vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1
end

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
	local node = require("nvim-tree.api").tree.get_node_under_cursor()
	if node and node.type == "directory" then
		require("nvim-tree.api").tree.change_root(node.absolute_path)
	else
		print("Наведи курсор на папку в nvim-tree")
	end
end, { desc = "Сделать root выбранную папку в nvim-tree" })
-- Base mappingsl
keymap("n", "<C-h>", "<C-w>h", { desc = "Левый буфер", silent = true, noremap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Нижний буфер", silent = true, noremap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Верхний буфер", silent = true, noremap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Правый буфер", silent = true, noremap = true })
keymap("n", "<leader>nh", "<cmd>nohl<CR>")
keymap({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Сохранить файл", silent = true, noremap = true })
keymap(
	"n",
	"<leader>bb",
	"<cmd>if &modified == 1 | w | endif<CR><cmd>bd<CR>",
	{ desc = "Закрыть и сохранить буфер", silent = true, noremap = true }
)
keymap("n", "<leader>bf", "<cmd>bd!<CR>", { desc = "Закрыть буфер", silent = true, noremap = true })
keymap("i", "<C-z>", "<Esc>ui", { desc = "Ctrl - Z в insert моде", noremap = true, silent = true })
-- Lsp
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

vim.api.nvim_create_user_command("MessagesBuf", function()
	local output = vim.api.nvim_exec("messages", true)
	vim.cmd("new")
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end, {})

if paths then
	local createUserCommands = function()
		for _, value in ipairs(userCommandsLabels) do
			vim.api.nvim_create_user_command(value, function(opts)
				local key = opts.args
				local path = paths[key]
				if path and is_dir(path) then
					vim.cmd(string.lower(value) .. " " .. path)
				else
					print("Unknown or invalid alias: " .. key)
				end
			end, { nargs = 1 })
		end
	end
	createUserCommands()
end
