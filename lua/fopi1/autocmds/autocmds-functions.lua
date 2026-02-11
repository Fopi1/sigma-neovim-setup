local M = {}

local status_ok, envPaths = pcall(require, "fopi1.env.paths")
local enable_ms = false
M.initialLoad = function()
	vim.api.nvim_set_hl(0, "MarkdownFieldName", { fg = "#ff5555", bold = true })
	vim.api.nvim_set_hl(0, "MarkdownFieldNick", { fg = "#ffcc00", italic = true })
	vim.api.nvim_set_hl(0, "MarkdownFieldLink", { fg = "#00aaff", underline = true })
	vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffcc00", underline = true, bg = "NONE" })
	vim.api.nvim_set_hl(0, "@markup.strong", { fg = "#b175b8", bold = true })

	for _, arg in ipairs(vim.v.argv) do
		if arg == "ms" then
			enable_ms = true
		end
	end

	local paths = vim.fn.argv()

	if enable_ms then
		local vcvars = vim.fn.getenv("VCVARS64")
		if vcvars ~= vim.NIL then
			vim.o.shell = "cmd.exe"
			vim.o.shellcmdflag = '/k "' .. vcvars .. '" &&'
		end
	end

	if #paths > 0 then
		local path = vim.fn.fnameescape(paths[1])
		local t = vim.fn.getftype(path)

		if t == "dir" then
			vim.cmd("cd " .. path)
		elseif t == "file" then
			vim.cmd("e " .. path)
		end
	else
		if status_ok == true then
			vim.cmd("cd " .. envPaths.works)
		end
	end
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
