local M = {}

local status_ok, paths = pcall(require, "fopi1.env.paths")
M.initialLoad = function()
	if status_ok then
		vim.cmd("cd " .. paths.works_path)
	end
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
	vim.cmd("tabnew")
	vim.cmd("terminal")
	vim.cmd("tabnext")
end

return M
