# Neovim AI-Enhanced Setup

This Neovim configuration is designed to provide a powerful development environment with a focus on AI-driven autocomplete and seamless integration with Aider for AI-assisted coding. It
leverages `Lazy.nvim` for plugin management and `neo-tree.nvim` for file system navigation.

## Core Components
* **Lazy.nvim**: Our plugin manager for efficient and declarative plugin loading.
* **neo-tree.nvim**: A powerful and highly customizable file explorer plugin for navigating your project structure, managing files, and viewing git status and open buffers.
* **nvim-treesitter**: Provides advanced syntax highlighting, code structure understanding, and indentation based on tree-sitter parsers.
* **Telescope**: Fuzzy finder with native FZF integration for fast file and content searching.
* **AI Autocomplete**: Powered by Minuet AI. Provides intelligent code suggestions and completions.
* **AI Autocomplete**: Powered by Supermaven (with optional Minuet AI). Provides intelligent code suggestions and completions.
* **Comment.nvim**: Smart and powerful comment plugin for Neovim, supporting line and block comments, dot repeat, and treesitter.
* **Aider Integration**: Enables AI-assisted code editing and collaboration directly within Neovim.
* **Git Blame**: Powered by git-blame.nvim. Shows git blame information as virtual text, displaying commit author, date, and summary for each line.
* **GitLinker**: Powered by gitlinker.nvim. Generate and copy GitHub URLs for files and lines directly to clipboard.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/gzinck/nvim-config.git ~/.config/nvim
   ```
2. **Launch Neovim:**
   Open Neovim. `Lazy.nvim` will automatically detect and install the plugins defined in `lua/plugins/`. If it doesn't, you can manually trigger the installation by running:
   ```vim
   :Lazy install
   ```
3. **Restart Neovim:**
   After installation, restart Neovim to ensure all plugins are loaded correctly.

4. **Install Treesitter Parsers:**
   After the initial Neovim launch and plugin installation, run `:TSUpdate` to install the language parsers for `nvim-treesitter`. This is crucial for syntax highlighting and other features to work correctly.

5. **Install LSP Servers:**
   For TypeScript/JavaScript support, install the required language servers:
   ```bash
   npm install -g typescript-language-server typescript
   npm install -g vscode-langservers-extracted  # for ESLint LSP
   ```
6. **Install Aider:**
   If you want to use Aider as your AI pair programmer, install it [using the docs](https://aider.chat/). The nvim integrations are already included in the config.

## Keybindings

This section documents all custom keybindings for the plugins used in this configuration.

The `<leader>` key is configured to `,` by default.

### Neo-tree

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `<leader>e`   | Toggle Neo-tree file explorer |
| `<leader>b`   | Toggle Neo-tree buffers list |
| `<leader>g`   | Toggle Neo-tree Git status view |
| `<enter>`     | Expand/close/open |
| `<backspace>` | Go up a directory |
| `a`           | Create new file or directory |
| `r`           | Rename selected file or directory |
| `d`           | Delete selected file or directory |
| `y`           | Copy selected file or directory |
| `m`           | Move selected file or directory |
| `R`           | Refresh the current directory view |
| `H`           | Toggle show hidden files |

### nvim-treesitter

`nvim-treesitter` provides enhanced syntax highlighting and structural understanding automatically for supported languages. No specific keybindings are typically needed for its core functionality.

### Supermaven

| Keybinding    | Description                  |
| :------------ | :--------------------------- |
| `<Tab>`       | Accept whole suggestion      |
| `<C-]>`       | Clear suggestion             |
| `<C-j>`       | Accept word                  |

### Linting (nvim-lint)

`nvim-lint` runs asynchronously on file save (`BufWritePost`) to provide real-time diagnostics. No specific keybindings are typically needed for its core functionality, as it integrates with Neovim's built-in diagnostic system.

Update the `lint.linters_by_ft` table in `lua/plugins/lint.lua` to add or remove linters for different file types.

Note: some linters can be directly integrated into Neovim's language server protocol (LSP) support, which is a more efficient and reliable way to run linters (e.g., `eslint`). Do not add linters to nvim-lint that are already supported by the LSP.

### Commenting (Comment.nvim)

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `gcc`         | Toggle line comment (Normal mode) |
| `gbc`         | Toggle block comment (Normal mode) |
| `gc{motion}`  | Toggle line comment for a motion (Normal mode) |
| `gb{motion}`  | Toggle block comment for a motion (Normal mode) |

### Aider

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `<leader>a/`  | Toggle Aider            |
| `<leader>as`  | Send to Aider (Normal/Visual mode) |
| `<leader>ac`  | Aider Commands          |
| `<leader>ab`  | Send Buffer             |
| `<leader>a+`  | Add File                |
| `<leader>a-`  | Drop File               |
| `<leader>ar`  | Add Read-Only           |
| `<leader>aR`  | Reset Session           |
| `<leader>ad`  | Send Diagnostics        |
| `<C-\><C-n>`  | Exit terminal mode      |

#### Neo-tree Integration

When navigating in neo-tree, you can use the following shortcuts:

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `+`           | Add file to Aider (in Neo-tree) |
| `-`           | Drop file from Aider (in Neo-tree) |
| `=`           | Add file as read-only to Aider (in Neo-tree) |

### Git Blame

| Keybinding               | Description                  |
| :----------------------- | :--------------------------- |
| `:GitBlameToggle`        | Toggle git blame on/off      |
| `:GitBlameEnable`        | Enable git blame messages    |
| `:GitBlameDisable`       | Disable git blame messages   |
| `:GitBlameOpenCommitURL` | Open commit URL in browser   |
| `:GitBlameCopySHA`       | Copy SHA hash to clipboard   |
| `:GitBlameCopyCommitURL` | Copy commit URL to clipboard |
| `:GitBlameOpenFileURL`   | Open file URL in browser     |
| `:GitBlameCopyFileURL`   | Copy file URL to clipboard   |

### Telescope

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `<leader>ff`  | Find files              |
| `<leader>fg`  | Live grep               |
| `<leader>fb`  | Find buffers            |
| `<leader>fh`  | Help tags               |

### GitLinker

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `<leader>gy`  | Copy GitHub URL of the current file/line to clipboard |

### LSP (Language Server Protocol)

TypeScript/JavaScript LSP support is configured using Neovim 0.11's new simplified LSP setup. The following key mappings are available when LSP is active:

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `gd`          | Go to definition        |
| `gri`         | Go to implementation    |
| `grt`         | Go to type definition   |
| `grr`         | Find references         |
| `grn`         | Rename symbol           |
| `gra`         | Code actions            |
| `gO`          | Document symbols        |
| `K`           | Show hover documentation|
| `<C-k>`       | Show signature help     |
| `<C-S>`       | Signature help (Insert mode) |
| `[d`          | Previous diagnostic     |
| `]d`          | Next diagnostic         |
| `[D`          | First diagnostic        |
| `]D`          | Last diagnostic         |

For more details, see [this blog post](https://gpanders.com/blog/whats-new-in-neovim-0-11/#more-default-mappings)

## Usage

1. **File Navigation**: Use `<leader>e` to open the file explorer and navigate your project.
2. **File Search**: Use `<leader>ff` to quickly find files, `<leader>fg` to search content.
3. **TypeScript/JavaScript Development**: Use `gri` to go to implementation, `grr` to find references, and other LSP shortcuts for code navigation.
4. **AI Completion**: Start typing and AI suggestions will appear. Supermaven suggestions are integrated with `blink.cmp`. Use the keybindings above to accept or navigate suggestions.
5. **Code Understanding**: Treesitter provides automatic syntax highlighting and code structure analysis.
6. **Code Linting**: Files are automatically linted on save, with diagnostics displayed via Neovim's built-in diagnostic system.
7. **Commenting**: Use `gcc` to toggle comments on a line, or visually select text and press `<leader>-/` to comment it out.
8. **Git Blame**: Git blame information appears as virtual text at the end of each line, showing the commit author, date, and summary. Use `:GitBlameToggle` to turn it on/off as needed.

## AI Code Completion

This setup uses **Supermaven** for intelligent code completion.

### Supermaven

Supermaven provides fast, high-quality code completion. Upon first use, you will be prompted to either use the Free Tier or activate a Supermaven Pro subscription.

**Supermaven Commands:**

| Command              | Description                                   |
| :------------------- | :-------------------------------------------- |
| `:SupermavenStart`   | Start Supermaven                              |
| `:SupermavenStop`    | Stop Supermaven                               |
| `:SupermavenRestart` | Restart Supermaven                            |
| `:SupermavenToggle`  | Toggle Supermaven on/off                      |
| `:SupermavenStatus`  | Show current status of Supermaven             |
| `:SupermavenUseFree` | Switch to the free version of Supermaven      |
| `:SupermavenUsePro`  | Switch to the pro version of Supermaven       |
| `:SupermavenLogout`  | Log out of Supermaven                         |
| `:SupermavenShowLog` | Show Supermaven logs                          |
| `:SupermavenClearLog`| Clear Supermaven logs                         |

