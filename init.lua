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

-- LSP Configuration
vim.lsp.enable({'ts_ls'})

-- Enable LSP auto-completion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- Custom diagnostic signs
local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = ""
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show diagnostics automatically
vim.diagnostic.config({
  signs = true,
  underline = true,
  virtual_text = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
