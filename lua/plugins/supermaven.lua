return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter", -- Load when entering insert mode
    dependencies = {
      "saghen/blink.cmp", -- Supermaven integrates with nvim-cmp, and blink.cmp is your completion engine
    },
    config = function()
      require("supermaven-nvim").setup({
        -- Disable inline completion to let blink.cmp handle suggestions
        disable_inline_completion = true,
        -- Optional: Configure keymaps if you don't want the defaults
        -- keymaps = {
        --   accept_suggestion = "<Tab>",
        --   clear_suggestion = "<C-]>",
        --   accept_word = "<C-j>",
        -- },
        -- Optional: Ignore specific filetypes
        -- ignore_filetypes = { lua = true },
        -- Optional: Set suggestion color
        -- color = {
        --   suggestion_color = "#ffffff",
        --   cterm = 244,
        -- },
        -- log_level = "info", -- set to "off" to disable logging completely
      })
    end,
  },
}
