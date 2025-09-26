return {
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy", -- Load the plugin when needed
    config = function()
      require('gitblame').setup({
        -- Enable the plugin by default
        enabled = true,
        -- Template for the blame message
        message_template = " <summary> • <date> • <author> • <<sha>>",
        -- Date format - using relative time (e.g., "3 days ago")
        date_format = "%r",
        -- Delay before showing blame info (in milliseconds)
        delay = 250,
        -- Virtual text column (start at end of line by default)
        virtual_text_column = nil,
        -- Highlight group for the blame text
        highlight_group = "Comment",
      })
    end,
  },
}
