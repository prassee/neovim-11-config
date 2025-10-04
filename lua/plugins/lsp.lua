return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup({
      ensure_installed = { "lua_ls", "stylua", "basedpyright", "ruff", "gopls" },
    })

    -- Diagnostics & inlay hints
    vim.lsp.inlay_hint.enable(true)
    vim.diagnostic.config({
      virtual_lines = true,
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

    local lspconfig = require("lspconfig")
    -- lspconfig = vim.lsp.config

    vim.lsp.config("basedpyright", {
      filetypes = { "python" },
      root_dir = lspconfig.util.root_pattern(
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git"
      ),
    })

    vim.lsp.config("gopls", {
      filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
      root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim", "require" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
