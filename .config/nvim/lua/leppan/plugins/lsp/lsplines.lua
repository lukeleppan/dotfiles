return {
	"maan2003/lsp_lines.nvim",
	version = "*", -- Always use the latest version
	config = function()
		require("lsp_lines").setup()
		-- Optionally, toggle lsp_lines with a keymap
		vim.keymap.set("n", "<Leader>ll", function()
			require("lsp_lines").toggle()
		end, { desc = "Toggle lsp_lines" })
		-- Disable virtual text since lsp_lines provides a better way to display diagnostics
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
