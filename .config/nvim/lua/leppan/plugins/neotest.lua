return {
	"nvim-neotest/neotest",
	dependencies = {
		"mrcjkb/rustaceanvim",
		"nvim-neotest/neotest-plenary",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-plenary"),
				require("rustaceanvim.neotest"),
			},
		})
	end,
}
