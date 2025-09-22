# Neovim AI-Enhanced Setup

This Neovim configuration is designed to provide a powerful development environment with a focus on AI-driven autocomplete and seamless integration with Aider for AI-assisted coding. It
leverages `Lazy.nvim` for plugin management and `neo-tree.nvim` for file system navigation.

## Core Components
* **Lazy.nvim**: Our plugin manager for efficient and declarative plugin loading.
* **neo-tree.nvim**: A powerful and highly customizable file explorer plugin for navigating your project structure, managing files, and viewing git status and open buffers.
* **nvim-treesitter**: Provides advanced syntax highlighting, code structure understanding, and indentation based on tree-sitter parsers.
* **Telescope**: Fuzzy finder with native FZF integration for fast file and content searching.
* **AI Autocomplete**: Powered by Minuet AI. Provides intelligent code suggestions and completions.
* **nvim-lint**: Asynchronous linter plugin for Neovim, providing real-time feedback on code quality and potential issues.
* **Comment.nvim**: Smart and powerful comment plugin for Neovim, supporting line and block comments, dot repeat, and treesitter.
* **Aider Integration**: Enables AI-assisted code editing and collaboration directly within Neovim.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git ~/.config/nvim
   ```
2. **Set up API keys:**
   For AI code completion, you'll need to set up at least one API key. Add to your shell profile (e.g., `~/.bashrc`, `~/.zshrc`):
   ```bash
   export CODESTRAL_API_KEY="your-codestral-api-key"
   # You can also set API keys for other providers like OPENAI_API_KEY, ANTHROPIC_API_KEY, GEMINI_API_KEY
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


## Keybindings

This section documents all custom keybindings for the plugins used in this configuration.

### Neo-tree

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `<leader>e`   | Toggle Neo-tree file explorer |
| `<leader>b`   | Toggle Neo-tree buffers list |
| `<leader>g`   | Toggle Neo-tree Git status view |
| `h`           | Go to parent directory (or select `..`) |
| `l`           | Enter selected directory/open file (or select `.`) |
| `a`           | Create new file or directory |
| `r`           | Rename selected file or directory |
| `d`           | Delete selected file or directory |
| `c`           | Copy selected file or directory |
| `m`           | Move selected file or directory |
| `R`           | Refresh the current directory view |

### nvim-treesitter

`nvim-treesitter` provides enhanced syntax highlighting and structural understanding automatically for supported languages. No specific keybindings are typically needed for its core functionality.

### AI Autocomplete (Minuet AI)

| Keybinding    | Description                  |
| :------------ | :--------------------------- |
| `<A-A>`       | Accept whole AI completion   |
| `<A-a>`       | Accept one line of completion|
| `<A-z>`       | Accept n lines (prompts for number) |
| `<A-[>`       | Previous completion or manually invoke |
| `<A-]>`       | Next completion or manually invoke |
| `<A-e>`       | Dismiss completion           |

### Linting (nvim-lint)

`nvim-lint` runs asynchronously on file save (`BufWritePost`) to provide real-time diagnostics. No specific keybindings are typically needed for its core functionality, as it integrates with Neovim's built-in diagnostic system.

### Commenting (Comment.nvim)

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `gcc`         | Toggle line comment (Normal mode) |
| `gbc`         | Toggle block comment (Normal mode) |
| `gc{motion}`  | Toggle line comment for a motion (Normal mode) |
| `gb{motion}`  | Toggle block comment for a motion (Normal mode) |
| `<leader>-/` | Toggle comment for visually selected text (Visual mode) |

### Aider

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `(To be added)`| (To be added)           |

### Telescope

| Keybinding    | Description             |
| :------------ | :---------------------- |
| `<leader>ff`  | Find files              |
| `<leader>fg`  | Live grep               |
| `<leader>fb`  | Find buffers            |
| `<leader>fh`  | Help tags               |

## Usage
1. **File Navigation**: Use `<leader>e` to open the file explorer and navigate your project.
2. **File Search**: Use `<leader>ff` to quickly find files, `<leader>fg` to search content.
3. **AI Completion**: Start typing and AI suggestions will appear as virtual text. Use the keybindings above to accept or navigate suggestions.
4. **Code Understanding**: Treesitter provides automatic syntax highlighting and code structure analysis.
5. **Code Linting**: Files are automatically linted on save, with diagnostics displayed via Neovim's built-in diagnostic system.
6. **Commenting**: Use `gcc` to toggle comments on a line, or visually select text and press `<leader>-/` to comment it out.

## AI Code Completion

This setup includes **Minuet AI**, which provides intelligent code completion using various LLM providers:

- **Default Provider**: Codestral (free and fast)
- **Supported Languages**: Lua, Python, JavaScript, TypeScript, Go, Rust, and more
- **Features**: 
  - Real-time AI-powered code suggestions
  - Virtual text completion
  - Multiple completion candidates
  - Configurable throttling to manage API usage

### Switching AI Providers
