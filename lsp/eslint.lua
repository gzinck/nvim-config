return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  root_markers = { '.eslintrc.js', '.eslintrc.json', '.eslintrc', 'package.json' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  settings = {
    eslint = {
      enable = true,
      autoFixOnSave = true,
    },
  },
}