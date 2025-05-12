return {
	"mkusm/nvim-papyrus",
	ft = { "papyrus" },
	config = function()
		vim.g.skyrim_install_path = require("fopi1.env.paths").skyrim
	end,
}
