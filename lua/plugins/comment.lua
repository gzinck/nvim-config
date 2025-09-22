return {
  {
    'numToStr/Comment.nvim',
    opts = {
      -- Add any options here.
      -- The default mappings are already good, but we'll add a custom one.
    },
    config = function()
      require('Comment').setup()
      -- Custom mapping for visual mode commenting with <leader>-/
      vim.api.nvim_set_keymap('x', '<leader>-/', 'gc', { noremap = true, silent = true, desc = "Comment selected text" })
    end,
  },
}
