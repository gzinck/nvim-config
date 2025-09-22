local function get_wordcount()
  local word_count = 0

  if vim.fn.mode():find("[vV]") then
    word_count = vim.fn.wordcount().visual_words
  else
    word_count = vim.fn.wordcount().words
  end

  return word_count
end

local function wordcount()
  local label = "word"
  local word_count = get_wordcount()

  if word_count > 1 then
    label = label .. "s"
  end

  return word_count .. " " .. label
end

local function is_prose()
  return vim.bo.filetype == "markdown" or vim.bo.filetype == "text"
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'milanglacier/minuet-ai.nvim',
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
        },
        sections = {
          lualine_x = {
            -- Minuet AI is disabled by default, so its lualine component is removed.
            -- If you re-enable Minuet AI, you can uncomment this line.
            -- {
            --   require 'minuet.lualine',
            --   display_name = 'model',
            --   display_on_idle = true,
            -- },
            'encoding',
            'filetype',
          },
          lualine_z = {
            { wordcount, cond = is_prose },
          },
        },
      })
    end,
  },
}
