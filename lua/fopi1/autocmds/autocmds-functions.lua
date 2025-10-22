local M = {}
-- Local variables
local lastDirPath = vim.fn.stdpath("data") .. "/fopi1/last_dir.txt"
--
M.writeLastDirPath = function()
	if vim.v.dying < 2 then
		local dir = vim.fn.fnamemodify(lastDirPath, ":h")
		vim.fn.mkdir(dir, "p")
		local cwd = vim.fn.getcwd()
		vim.fn.writefile({ cwd }, lastDirPath)
	end
end

M.initialLoad = function()
	vim.api.nvim_set_hl(0, "MarkdownFieldName", { fg = "#ff5555", bold = true })
	vim.api.nvim_set_hl(0, "MarkdownFieldNick", { fg = "#ffcc00", italic = true })
	vim.api.nvim_set_hl(0, "MarkdownFieldLink", { fg = "#00aaff", underline = true })
	vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffcc00", underline = true, bg = "NONE" })
	vim.api.nvim_set_hl(0, "@markup.strong", { fg = "#b175b8", bold = true })
end

M.saveWhenLeaveBuffer = function()
	if vim.bo.modified and vim.fn.expand("%") ~= "" then
		vim.cmd("w")
	end
end

M.afterSessionLoaded = function()
	vim.cmd("NvimTreeOpen")
end

return M
