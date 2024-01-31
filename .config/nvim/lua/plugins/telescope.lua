return {
  {
    "telescope.nvim",
    keys = {
      { "<leader>fp", "<cmd>Telescope neovim-project discover<cr>" },
      { "<leader>fh", "<cmd>Telescope neovim_project history<cr>" },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
