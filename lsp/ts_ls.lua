return {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  settings = {
    typescript = {
      preferences = {
        disableSuggestions = true,
      },
    },
    javascript = {
      preferences = {
        disableSuggestions = true,
      },
    },
  },
}