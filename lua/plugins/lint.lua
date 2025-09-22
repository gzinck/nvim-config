-- lua/plugins/lint.lua
return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' }, -- Trigger linting on these events
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        python = { 'flake8', 'mypy', 'pylint', 'ruff' },
        lua = { 'luacheck', 'selene' },
        javascript = { 'eslint_d', 'biomejs', 'oxlint' },
        typescript = { 'eslint_d', 'biomejs', 'oxlint' },
        markdown = { 'markdownlint-cli2', 'vale' },
        yaml = { 'yamllint' },
        sh = { 'shellcheck' },
        -- Add more linters for other file types as needed.
        -- Ensure the corresponding linter tools are installed on your system.
      }

      -- Autocommand to run linters on file save
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- Optional: You can customize how diagnostics are displayed.
      -- For example, to show virtual text for all linters:
      -- vim.diagnostic.config({
      --   virtual_text = true,
      --   signs = true,
      --   update_in_insert = false,
      --   severity_sort = true,
      --   float = {
      --     focusable = false,
      --     style = 'minimal',
      --     border = 'rounded',
      --     source = 'always',
      --     header = '',
      --     prefix = '',
      --   },
      -- })
    end,
  },
}
