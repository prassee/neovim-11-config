-- =============================================================================
-- INIT.LUA - Neovim Configuration
-- =============================================================================

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- SECTION 1: GLOBALS & OPTIONS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Leader & Global Variables
-- -----------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.copilot_no_tab_map = true -- Disable default Copilot tab mapping
vim.opt.clipboard = "unnamedplus"

-- -----------------------------------------------------------------------------
-- Disable Built-in Completion (use blink.cmp instead)
-- -----------------------------------------------------------------------------
vim.g.native_lsp_completion = false -- Disable Neovim 0.11+ native LSP completion

-- -----------------------------------------------------------------------------
-- Line Numbers
-- -----------------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = false

-- -----------------------------------------------------------------------------
-- UI
-- -----------------------------------------------------------------------------
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.winborder = "rounded"

-- -----------------------------------------------------------------------------
-- Whitespace Characters
-- -----------------------------------------------------------------------------
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- -----------------------------------------------------------------------------
-- Search
-- -----------------------------------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- -----------------------------------------------------------------------------
-- Text Wrapping
-- -----------------------------------------------------------------------------
vim.opt.wrap = true
vim.opt.breakindent = true

-- -----------------------------------------------------------------------------
-- Tabs & Indentation
-- -----------------------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- -----------------------------------------------------------------------------
-- Window Splitting
-- -----------------------------------------------------------------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

-- -----------------------------------------------------------------------------
-- Persistence
-- -----------------------------------------------------------------------------
vim.opt.undofile = true

-- -----------------------------------------------------------------------------
-- Syntax
-- -----------------------------------------------------------------------------
-- Keep Vim syntax enabled as fallback when Treesitter parser unavailable

-- -----------------------------------------------------------------------------
-- Diagnostics
-- -----------------------------------------------------------------------------
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "⚠",
      [vim.diagnostic.severity.INFO] = "💡",
      [vim.diagnostic.severity.HINT] = "ℹ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

vim.g.opencode_opts = {
  provider = {
    enabled = "wezterm",
  },
}

-- =============================================================================
-- SECTION 2: LAZY SETUP
-- =============================================================================

require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
  },
  install = {
    colorscheme = { "catppuccin" },
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- =============================================================================
-- SECTION 3: AUTOCOMMANDS
-- =============================================================================

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- =============================================================================
-- SECTION 4: KEYMAPS
-- =============================================================================
require("keymaps")