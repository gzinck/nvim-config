return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' }, -- Load before saving
    cmd = { 'ConformInfo' }, -- Load when running ConformInfo command
    keys = {
      {
        '<leader>fo',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          markdown = { 'prettier' },
          typescript = { 'prettier' },
          javascript = { 'prettier' },
          typescriptreact = { 'prettier' },
          javascriptreact = { 'prettier' },
          css = { 'prettier' },
          scss = { 'prettier' },
          html = { 'prettier' },
        },
        -- Format on save
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
