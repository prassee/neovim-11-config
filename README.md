# Modern Neovim Configuration (0.11.4+)

A modern, feature-rich Neovim configuration built specifically for Neovim 0.11.4 and later versions, utilizing the latest features and improvements.

## TODO 
- [ ] add lsp support for TOML 
- [ ] add lsp support for JSON
- [ ] add lsp support for Markdown with mermaid diagrams preview

## ✨ Features

### Core Functionality
- **lazy.nvim** - Modern plugin manager with lazy loading
- **LSP Support** - Complete Language Server Protocol setup for:
  - Lua (`lua_ls`)
  - Python (`basedpyright`, `ruff`)
  - Go (`gopls`)
- **Auto-completion** - `blink.cmp` for fast, modern completion
- **Fuzzy Finding** - `fzf-lua` for blazing fast file/text search
- **Syntax Highlighting** - Treesitter with extensive language support
- **Auto-formatting** - `conform.nvim` with format-on-save

### AI Integration
- **GitHub Copilot** - AI-powered code suggestions
- **Copilot Chat** - Interactive AI coding assistant

### UI & Navigation
- **Neo-tree** - Modern file explorer with git integration
- **which-key** - Keybinding discovery and organization
- **lualine** - Beautiful and informative statusline
- **gitsigns** - Git integration with visual indicators
- **Multiple colorschemes** - Tokyo Night and Catppuccin

### Development Tools
- **Mason** - Automatic LSP server, formatter, and linter management
- **Diagnostics** - Real-time error and warning display
- **Git Integration** - Visual git status, blame, and hunk navigation

## 🚀 Quick Start

### Prerequisites
- Neovim 0.11.4 or later
- Git
- A terminal with true color support
- Node.js (for Copilot and some formatters)
- Optional: A Nerd Font for better icons

### Installation

1. **Backup your existing config (if any):**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

4. **Let lazy.nvim install plugins automatically** - This will happen on first startup

5. **Install LSP servers, formatters, and linters:**
   - Open Neovim and run `:Mason`
   - Everything should install automatically based on the configuration

### GitHub Copilot Setup

1. Install the Copilot CLI: `npm install -g @githubnext/github-copilot-cli`
2. In Neovim, run `:Copilot auth` to authenticate
3. Run `:Copilot enable` to activate

## ⌨️ Key Mappings

### Leader Key
- **Leader**: `<Space>`
- **Local Leader**: `\`

### Essential Navigation
| Key | Action |
|-----|--------|
| `<leader><leader>` | Find buffers |
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep |
| `<leader>sh` | Search help |
| `\\` | Toggle file explorer |
| `<C-h/j/k/l>` | Navigate windows |

### LSP & Code
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gR` | Show references |
| `gi` | Go to implementation |
| `K` | Show hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format buffer |
| `[d` / `]d` | Navigate diagnostics |

### Git Integration
| Key | Action |
|-----|--------|
| `]c` / `[c` | Next/previous git change |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

### AI/Copilot
| Key | Action |
|-----|--------|
| `<M-l>` | Accept Copilot suggestion |
| `<M-]>` / `<M-[>` | Next/previous suggestion |
| `<leader>cch` | Toggle Copilot Chat |
| `<leader>cce` | Explain code |
| `<leader>cct` | Generate tests |

## 📁 Configuration Structure

```
├── init.lua
└── lua/
    ├── core/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── autocmds.lua
    └── plugins/
        ├── init.lua         -- lazy.nvim bootstrap
        ├── lsp.lua          -- Mason + LSP
        ├── cmp.lua          -- blink.cmp + LuaSnip
        ├── conform.lua      -- formatting
        ├── comment.lua      -- Comment.nvim
        ├── oil.lua          -- file explorer
        ├── telescope.lua    -- fzf-lua (telescope alternative)
        ├── toggleterm.lua   -- terminal
        ├── tokyonight.lua   -- colorscheme
        ├── lualine.lua      -- statusline
        ├── which-key.lua    -- key hints
        ├── copilot.lua      -- GitHub Copilot
        └── copilot-chat.lua -- Copilot Chat
```

## 🎨 Customization

### Changing Colorscheme
Edit `lua/plugins/colorscheme.lua` and modify the `init` function:
```lua
init = function()
  vim.cmd.colorscheme("catppuccin-mocha")  -- or "tokyonight-night"
end,
```

### Adding Language Support
1. Add the language server to `ensure_installed` in `lua/plugins/mason.lua`
2. Add server configuration in `lua/plugins/lsp.lua`
3. Add formatters to `lua/plugins/conform.lua`
4. Add treesitter parsers to `lua/plugins/treesitter.lua`

### Custom Keybindings
Add your keybindings to `lua/config/keymaps.lua` or in the respective plugin files.

## 🔧 Neovim 0.11.4+ Features Used

- `vim.loader.enable()` - Faster Lua module loading
- `vim.uv` - New UV bindings for file system operations
- Enhanced LSP capabilities
- Improved diagnostic system
- Modern autocommand API
- Updated keymap API

## 🐛 Troubleshooting

### Common Issues

1. **Plugins not loading**: Run `:Lazy sync` to update plugins
2. **LSP not working**: Check `:Mason` and `:LspInfo`
3. **Copilot not working**: Run `:Copilot status` and `:Copilot auth`
4. **Formatters not working**: Check `:ConformInfo`

### Getting Help
- Use `:checkhealth` to diagnose issues
- Press `<leader>` and wait to see available keybindings
- Use `:help` followed by any command for documentation

## 📝 Notes

This configuration is designed to be:
- **Fast**: Lazy loading and optimized startup
- **Modern**: Uses latest Neovim features
- **Complete**: Everything needed for development
- **Extensible**: Easy to customize and extend

The configuration automatically installs and configures everything needed for a productive development environment with Lua, Python, and Go support out of the box.
