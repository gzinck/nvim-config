# Neovim AI-Enhanced Setup

This Neovim configuration is designed to provide a powerful development environment with a focus on AI-driven autocomplete and seamless integration with Aider for AI-assisted coding. It
leverages `Lazy.nvim` for plugin management and `neo-tree.nvim` for file system navigation.

* **nvim-treesitter**: Provides advanced syntax highlighting, code structure understanding, and indentation based on tree-sitter parsers.
## Core Components
* **Lazy.nvim**: Our plugin manager for efficient and declarative plugin loading.
* **neo-tree.nvim**: A powerful and highly customizable file explorer plugin for navigating your project structure, managing files, and viewing git status and open buffers.
* **AI Autocomplete**: (Details to be added)
* **Aider Integration**: (Details to be added)

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git ~/.config/nvim
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

### nvim-treesitter

`nvim-treesitter` provides enhanced syntax highlighting and structural understanding automatically for supported languages. No specific keybindings are typically needed for its core functionality.

### AI Autocomplete

(Keybindings to be added)

### Aider

(Keybindings to be added)

## Usage

(Details to be added)
