local function safeRequire(mod)
	local ok, result = pcall(require, mod)
	if not ok then
		vim.notify("Failed to load module: " .. mod .. "\n" .. result, vim.log.levels.ERROR)
	end
	return result
end
return safeRequire
