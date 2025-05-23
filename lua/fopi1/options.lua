local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.scrolloff = 4

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.termguicolors = true
opt.laststatus = 3

local function escape(str)
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

opt.langmap = vim.fn.join({
	escape(ru_shift) .. ";" .. escape(en_shift),
	escape(ru) .. ";" .. escape(en),
}, ",")
