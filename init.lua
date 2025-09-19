require("config.lazy")

-- General Neovim settings
vim.opt.syntax = "on"             -- Turn on syntax highlighting
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.shiftwidth = 4            -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 4               -- Number of spaces that a tab in the file counts for
vim.opt.smartindent = true        -- Smart autoindenting
vim.opt.hlsearch = true           -- Highlight search results
vim.opt.ignorecase = true         -- Ignore case in search patterns
vim.opt.smartcase = true          -- Override 'ignorecase' if search pattern contains uppercase characters
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for copy and paste
vim.opt.autoread = true           -- Auto-reload files changed externally (needed for Aider)
