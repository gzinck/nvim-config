return {
  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup({
        opts = {
          action_callback = require("gitlinker.actions").copy_to_clipboard,
          add_current_line_on_normal_mode = true,
        },
      })

      vim.api.nvim_set_keymap('n', '<leader>gy', '<cmd>lua require("gitlinker").get_buf_range_url("n", {action_callback = require("gitlinker.actions").copy_to_clipboard})<cr>', {silent =
true})
    end,
  }
}
