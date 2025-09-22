-- lua/plugins/neo-tree.lua
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    cmd = "Neotree", -- Only load Neo-tree when the Neotree command is used
    keys = {
      { "<leader>e", "<Cmd>Neotree filesystem reveal toggle<CR>", desc = "Toggle Neo-tree File Explorer" },
      { "<leader>b", "<Cmd>Neotree buffers reveal toggle<CR>", desc = "Toggle Neo-tree Buffers List" },
      { "<leader>g", "<Cmd>Neotree git_status reveal toggle<CR>", desc = "Toggle Neo-tree Git Status" },
    },
    opts = {
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        use_libuv_file_watcher = true, -- Enable OS level file watchers for automatic refresh
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
    },
    config = function(_, opts)
      -- Add nvim-aider integration to Neo-tree if available
      if pcall(require, "nvim_aider.neo_tree") then
        require("nvim_aider.neo_tree").setup(opts)
      end
      
      require("neo-tree").setup(opts)
    end,
  },
}
