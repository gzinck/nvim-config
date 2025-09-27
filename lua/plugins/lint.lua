-- lua/plugins/lint.lua
return {
  {
    'mfussenegger/nvim-lint',
    -- event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' }, -- Trigger linting on these events
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        -- python = { 'flake8', 'mypy', 'pylint', 'ruff' },
        -- lua = { 'luacheck', 'selene' },
        javascript = { 'eslint' },
        typescript = { 'eslint' },
        typescriptreact = { 'eslint' },
        javascriptreact = { 'eslint' },
        -- markdown = { 'markdownlint-cli2', 'vale' },
        -- yaml = { 'yamllint' },
        -- sh = { 'shellcheck' },
        -- Add more linters for other file types as needed.
        -- Ensure the corresponding linter tools are installed on your system.
      }

      -- Autocommand to run linters on file save and on file open/read
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
        callback = function()
          lint.try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },
}
