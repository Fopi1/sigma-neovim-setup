local safeRequire = require("functions.safeRequire")

local M = {}
-- Local variables
local paths = safeRequire("fopi1.env.paths")
local lastDirPath = vim.fn.stdpath("data") .. "/fopi1/last_dir.txt"
local localePath = vim.fn.stdpath("data") .. "/fopi1/savedLocale.txt"
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
	local lastDir = vim.fn.readfile(lastDirPath)[1] or ""
	if lastDir ~= "" then
		vim.cmd("silent! cd " .. vim.fn.readfile(lastDirPath)[1])
	end
	vim.cmd("NvimTreeToggle")
	vim.cmd("tabnew")
	vim.cmd("terminal")
	vim.cmd("tabnext")
	vim.cmd("hi MatchParen gui=underline guifg=#ffcc00 guibg=NONE")
end
M.saveWhenLeaveBuffer = function()
	if vim.bo.modified and vim.fn.expand("%") ~= "" then
		vim.cmd("w")
	end
end
return M
