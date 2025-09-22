return {
  {
    'numToStr/Comment.nvim',
    opts = {
      -- Add any options here.
      -- The default mappings are already good, but we'll add a custom one.
    },
    config = function()
      require('Comment').setup()
    end,
  },
}
