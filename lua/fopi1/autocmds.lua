local autocmd = vim.api.nvim_create_autocmd
local path = vim.fn.stdpath("cache") .. "\\last_dir.txt"

autocmd("VimLeavePre", {
	callback = function()
		local cwd = vim.fn.getcwd()
		vim.fn.writefile({ cwd }, path)
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- 1) Перейти в нужный каталог и открыть NvimTree слева
		vim.cmd("silent! lcd " .. vim.fn.readfile(path)[1])
		vim.cmd("NvimTreeToggle")

		-- 2) Вернуться из NvimTree в основной буфер
		vim.cmd("wincmd p")

		-- 3) Вертикальный сплит для правой панели
		vim.cmd("vsplit")

		-- 4) Горизонтальный сплит внизу для терминала (15% высоты)
		local total_h = vim.api.nvim_win_get_height(0)
		local term_h = math.floor(total_h * 0.15)
		vim.cmd("belowright split")
		vim.api.nvim_win_set_height(0, term_h)
		vim.cmd("term") -- открываем встроенный терминал

		-- 5) Возврат в окно сверху и вертикальный сплит на две равные части
		vim.cmd("wincmd k")
		vim.cmd("vsplit")
		vim.cmd("wincmd =") -- выравнивает все окна по ширине/высоте
	end,
})

autocmd("BufWinLeave", {
	callback = function()
		if vim.bo.modified then
			vim.cmd("w")
		end
	end,
})
