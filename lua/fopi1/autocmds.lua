local autocmd = vim.api.nvim_create_autocmd
local path = vim.fn.stdpath("cache") .. "\\last_dir.txt"

autocmd("VimLeavePre", {
	callback = function()
		local cwd = vim.fn.getcwd()
		vim.fn.writefile({ cwd }, path)
	end,
})

autocmd("VimEnter", {
	callback = function()
		local lines = vim.fn.readfile(path)
		if lines and lines[1] then
			vim.cmd("silent! lcd " .. lines[1])
		end
	end,
})

autocmd("BufWinLeave", {
	callback = function()
		if vim.bo.modified then
			vim.cmd("w")
		end
	end,
})
