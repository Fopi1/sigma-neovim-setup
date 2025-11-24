local M = {}

local icons = {
	check = "✅",
	cross = "❌",
	warning = "⚠️",
	progress = "🔄",
	deprecated = "🕸",
}

local function bindkeymap(icon, bind, comment)
	if comment == nil then
		comment = ""
	end
	return vim.keymap.set("n", "<leader>" .. bind, function()
		M.insert(icon)
	end, { desc = "Insert" .. icons[icon] .. comment })
end

function M.insert(icon)
	local char = icons[icon]
	if not char then
		vim.notify("Unknown icon:" .. icon, vim.log.levels.ERROR)
		return
	end
	vim.api.nvim_put({ char }, "c", true, true)
end

function M.setup()
	bindkeymap("check", "mc")
	bindkeymap("cross", "mx")
	bindkeymap("warning", "mw")
	bindkeymap("progress", "mp")
	bindkeymap("deprecated", "md")
end

return M
