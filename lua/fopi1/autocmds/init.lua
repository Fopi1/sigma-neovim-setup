local functions = require("fopi1.autocmds.autocmds-functions")
local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
	callback = functions.initialLoad,
})

autocmd("BufWinLeave", {
	callback = functions.saveWhenLeaveBuffer,
})

autocmd("SessionLoadPost", {
	callback = functions.afterSessionLoaded,
})
