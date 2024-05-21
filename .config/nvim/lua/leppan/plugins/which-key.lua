return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")

		wk.register({
			f = {
				name = "+Files",
			},
			b = {
				name = "+Buffers",
			},
			c = {
				name = "+Code",
			},
			x = {
				name = "+Trouble",
			},
		}, { prefix = "<leader>" })
	end,
}
