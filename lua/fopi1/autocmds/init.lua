local functions = require("fopi1.autocmds.autocmds-functions")
local autocmd = vim.api.nvim_create_autocmd
autocmd("VimLeavePre", {
	callback = functions.writeLastDirPath,
})

autocmd("VimEnter", {
	callback = functions.initialLoad,
})

autocmd("BufWinLeave", {
	callback = functions.saveWhenLeaveBuffer,
})

autocmd("InsertLeave", {
	callback = functions.changeLastLocale or function() end,
})

autocmd("InsertEnter", {
	callback = functions.setLastLocale or function() end,
})
