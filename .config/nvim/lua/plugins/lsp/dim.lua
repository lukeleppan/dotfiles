return {
  {
    "0oAstro/dim.lua",
    event = "LspAttach",
    config = function()
      require("dim").setup({})
    end,
  },
}
