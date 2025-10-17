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
	local lastDir = vim.fn.readfile(lastDirPath)[1] or ""
	if lastDir ~= "" then
		vim.cmd("silent! cd " .. lastDir)
	end
	vim.cmd("NvimTreeToggle")
	vim.cmd("tabnew")
	vim.cmd("terminal")
	vim.cmd("tabnext")
end

M.saveWhenLeaveBuffer = function()
	if vim.bo.modified and vim.fn.expand("%") ~= "" then
		vim.cmd("w")
	end
end
return M
