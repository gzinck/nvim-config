return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("snacks").setup({
        terminal = {},
        picker = {},
      })
    end,
  },
}
