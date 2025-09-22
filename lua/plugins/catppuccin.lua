return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensure it loads before other plugins that might depend on its colors
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: "latte", "frappe", "macchiato", "mocha"
        background = { -- Set default background for light/dark modes
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- Set to true if you want a transparent background
        term_colors = true, -- Set terminal colors
        integrations = {
          -- By default, 'cmp', 'gitsigns', 'nvimtree', 'treesitter', 'mini' are enabled if default_integrations is true (which it is by default).
          -- We explicitly enable/configure other integrations based on your existing plugins.
          neotree = true, -- For nvim-neo-tree
          telescope = {
            enabled = true,
          },
          blink_cmp = {
            style = 'bordered', -- As suggested by catppuccin docs for blink.cmp
          },
          snacks = {
            enabled = true,
          },
          -- lualine theme is set directly in lua/plugins/lualine.lua
          -- treesitter integration is enabled by default, but requires an additional setting in its config file.
        },
      })
      -- Set the colorscheme after setup
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
