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
opt.expandtab = false

opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.termguicolors = true
opt.laststatus = 3
opt.wrap = false

vim.api.nvim_set_hl(0, "MarkdownFieldName", { fg = "#ff5555", bold = true })
vim.api.nvim_set_hl(0, "MarkdownFieldNick", { fg = "#ffcc00", italic = true })
vim.api.nvim_set_hl(0, "MarkdownFieldLink", { fg = "#00aaff", underline = true })
vim.cmd("hi MatchParen gui=underline guifg=#ffcc00 guibg=NONE")

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
