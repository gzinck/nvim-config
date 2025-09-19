return {
  {
    "GeorgesAlkhouri/nvim-aider",
    cmd = "Aider",
    keys = {
      { "<leader>a/", "<cmd>Aider toggle<cr>", desc = "Toggle Aider" },
      { "<leader>as", "<cmd>Aider send<cr>", desc = "Send to Aider", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>Aider command<cr>", desc = "Aider Commands" },
      { "<leader>ab", "<cmd>Aider buffer<cr>", desc = "Send Buffer" },
      { "<leader>a+", "<cmd>Aider add<cr>", desc = "Add File" },
      { "<leader>a-", "<cmd>Aider drop<cr>", desc = "Drop File" },
      { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add Read-Only" },
      { "<leader>aR", "<cmd>Aider reset<cr>", desc = "Reset Session" },
      { "<leader>ad", "<cmd>Aider buffer diagnostics<cr>", desc = "Send Diagnostics" },
    },
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      require("nvim_aider").setup({
        aider_cmd = "aider",
        args = {
          "--no-auto-commits",
          "--pretty",
          "--stream",
        },
        auto_reload = true,
        notifications = true,
        win = {
          wo = { winbar = "Aider" },
          style = "nvim_aider",
          position = "right",
        },
      })
    end,
  },
}
