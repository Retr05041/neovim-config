# neovim-config
My Neovim config

## Setup
1. Run `besmart.sh`.
2. Follow instructions.

## Plugins
- **Alpha**: Used for front page
- **catppucin**: Theme
- **completions**: Autocompletions
  - *cmp-nvim-lsp*: Main engine
  - *LuaSnip*: For snippit integration
  - *nvim-cmp*: Controller
- **~~Copilot~~**:Github Co-pilot
- **lualine**: Info line
- **lsp-config**:
  - *mason*: Main LSP Engine
  - *mason-lspconfig*: Installs language servers
  - *nvim-lspconfig*: Connects to auto-completion
- **neo-tree**: File Tree
- **none-ls**: Linter and formatter for specific languages
- **telescope**: Language parsing tool and highlighter
- **treesitter**: Fuzzy Finder

## Keybindings
- leader+y = Yank to clipboard
- leader+p = Paste from clipboard
- leader+s = IDE save
- leader+w = IDE close current buffer
- leader+e = Edit snippets for current file extension

## TODO
- Create keybinds for traversing automplete dropdown
- Convert `besmart.sh` to Python?
- Add this repo to Base configuration repo
- Determine best selection of languages to have installed at base
- Re-apply to github copilot
- Add snippit exchange to setup script
