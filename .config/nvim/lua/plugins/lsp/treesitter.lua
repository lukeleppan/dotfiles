return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "angular",
        "just",
      })
    end,
    dependencies = {
      {
        "IndianBoy42/tree-sitter-just",
        config = function()
          require("nvim-treesitter.parsers").get_parser_configs().just = {
            install_info = {
              url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
              files = { "src/parser.c", "src/scanner.c" },
              branch = "main",
              -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
            },
            maintainers = { "@IndianBoy42" },
          }
        end,
      },
    },
  },
}
