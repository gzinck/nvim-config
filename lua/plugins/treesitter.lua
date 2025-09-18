-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- Treesitter is a core component and should not be lazy-loaded
    branch = "main", -- Use the main branch as recommended
    build = ":TSUpdate", -- Automatically update parsers on plugin update
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Enable syntax highlighting
        highlight = {
          enable = true,
          -- Disable treesitter for large files to prevent performance issues
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        -- Enable treesitter-based indentation
        indent = { enable = true },
        -- Ensure these parsers are installed
        ensure_installed = {
          "typescript",
          "javascript",
          "markdown",
          "make",
          "go",
          "html",
          "css",
          "scss",
          "lua", -- Always good to have for Neovim config files
        },
        -- Install parsers synchronously for bootstrapping
        sync_install = false, -- Set to `true` if you want to install parsers synchronously
        auto_install = true, -- Automatically install missing parsers
        -- Additional Treesitter modules (optional)
        -- You can enable more features here if desired, e.g.,
        -- incremental_selection = { enable = true },
        -- textobjects = { enable = true },
      })
    end,
  },
}
