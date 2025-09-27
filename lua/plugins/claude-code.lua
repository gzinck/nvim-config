return {
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    cmd = {
      "ClaudeCode",
      "ClaudeCodeContinue", 
      "ClaudeCodeResume",
      "ClaudeCodeVerbose"
    },
    keys = {
      {
        "<leader>cc",
        "<cmd>ClaudeCode<cr>",
        desc = "Toggle Claude Code"
      },
      {
        "<leader>cC",
        "<cmd>ClaudeCodeContinue<cr>",
        desc = "Claude Code Continue"
      },
      {
        "<leader>cV",
        "<cmd>ClaudeCodeVerbose<cr>",
        desc = "Claude Code Verbose"
      },
      {
        "<C-,>",
        "<cmd>ClaudeCode<cr>",
        desc = "Toggle Claude Code",
        mode = { "n", "t" }
      },
    },
    config = function()
      require("claude-code").setup({
        -- Terminal window settings
        window = {
          split_ratio = 0.3,      -- Percentage of screen for the terminal window
          position = "botright",  -- Position: "botright", "topleft", "vertical", "float"
          enter_insert = true,    -- Enter insert mode when opening Claude Code
          hide_numbers = true,    -- Hide line numbers in terminal window
          hide_signcolumn = true, -- Hide sign column in terminal window

          -- Floating window configuration (only when position = "float")
          float = {
            width = "80%",        -- Width: number or percentage string
            height = "80%",       -- Height: number or percentage string
            row = "center",       -- Row position: number, "center", or percentage
            col = "center",       -- Column position: number, "center", or percentage
            relative = "editor",  -- Relative to: "editor" or "cursor"
            border = "rounded",   -- Border: "none", "single", "double", "rounded", "solid", "shadow"
          },
        },
        -- File refresh settings
        refresh = {
          enable = true,           -- Enable file change detection
          updatetime = 100,        -- updatetime when Claude Code is active (ms)
          timer_interval = 1000,   -- How often to check for file changes (ms)
          show_notifications = true, -- Show notification when files are reloaded
        },
        -- Git project settings
        git = {
          use_git_root = true,     -- Set CWD to git root when opening Claude Code
        },
        -- Shell-specific settings
        shell = {
          separator = '&&',        -- Command separator used in shell commands
          pushd_cmd = 'pushd',     -- Command to push directory onto stack
          popd_cmd = 'popd',       -- Command to pop directory from stack
        },
        -- Command settings
        command = "claude",        -- Command used to launch Claude Code
        -- Command variants
        command_variants = {
          continue = "--continue", -- Resume the most recent conversation
          resume = "--resume",     -- Display interactive conversation picker
          verbose = "--verbose",   -- Enable verbose logging
        },
        -- Keymaps
        keymaps = {
          toggle = {
            normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code
            terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code
            variants = {
              continue = "<leader>cC", -- Normal mode keymap for continue flag
              verbose = "<leader>cV",  -- Normal mode keymap for verbose flag
            },
          },
          window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true,         -- Enable scrolling keymaps (<C-f/b>)
        }
      })
    end
  }
}
