local M = {}

-- Local variables
local paths = require("fopi1.env.paths")
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
	vim.cmd("wincmd l")
	vim.cmd("split")
	vim.cmd("wincmd j")
	vim.cmd("resize 8")
	vim.cmd("terminal")
	vim.cmd("wincmd k")
end
M.saveWhenLeaveBuffer = function()
	if vim.bo.modified and vim.fn.expand("%") ~= "" then
		vim.cmd("w")
	end
end
M.writeLastLocale = function()
	local savedLocale = vim.fn.system(paths.imselect)
	if savedLocale ~= "1033" then
		vim.fn.writefile({ savedLocale }, localePath)
	end
	vim.fn.system(paths.imselect .. " 1033")
end
M.setLastLocale = function()
	local loadedLocale = vim.fn.filereadable(localePath) == 1 and vim.fn.readfile(localePath)[1] or ""
	if loadedLocale ~= "" then
		vim.fn.system(paths.imselect .. " " .. loadedLocale)
	end
end
return M
