return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "lua_ls",
        "stylua",
        -- "basedpyright",
        -- "ruff",
        "gopls",
        "rust_analyzer",
        "dockerls",
        "taplo",
        "jsonls",
        "pyrefly",
        "marksman",
        "prettier",
        "prettierd",
        "tinymist",
      },
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

    -- local lspconfig = require("lspconfig")
    -- lspconfig = vim.lsp.config
    vim.lsp.config("pyrefly", {
      cmd = { "pyrefly", "lsp" },
    })

    -- vim.lsp.config("basedpyright", {
    --   cmd = { "basedpyright-langserver", "--stdio" },
    --   filetypes = { "python" },
    --   root_markers = {
    --     "pyproject.toml",
    --     "setup.py",
    --     "setup.cfg",
    --     "requirements.txt",
    --     "Pipfile",
    --     "pyrightconfig.json",
    --     ".git",
    --   },
    --   settings = {
    --     basedpyright = {
    --       analysis = {
    --         autoSearchPaths = true,
    --         useLibraryCodeForTypes = true,
    --         diagnosticMode = "workspace",
    --         typeCheckingMode = "basic",
    --       },
    --     },
    --   },
    -- })

    vim.lsp.config("gopls", {
      cmd = { "gopls" }, -- Command to start the language server
      filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" }, -- File types that this server will handle
      root_markers = { "go.mod", "go.work", ".git" }, -- Markers to identify the root of the project
      settings = { -- Settings for the language server
        gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
            unreachable = true,
            modernize = true,
            stylecheck = true,
            appends = true,
            asmdecl = true,
            assign = true,
            atomic = true,
            bools = true,
            buildtag = true,
            cgocall = true,
            composite = true,
            contextcheck = true,
            deba = true,
            atomicalign = true,
            composites = true,
            copylocks = true,
            deepequalerrors = true,
            defers = true,
            deprecated = true,
            directive = true,
            embed = true,
            errorsas = true,
            fillreturns = true,
            framepointer = true,
            gofix = true,
            hostport = true,
            infertypeargs = true,
            lostcancel = true,
            httpresponse = true,
            ifaceassert = true,
            loopclosure = true,
            nilfunc = true,
            nonewvars = true,
            noresultvalues = true,
            printf = true,
            shadow = true,
            shift = true,
            sigchanyzer = true,
            simplifycompositelit = true,
            simplifyrange = true,
            simplifyslice = true,
            slog = true,
            sortslice = true,
            stdmethods = true,
            stdversion = true,
            stringintconv = true,
            structtag = true,
            testinggoroutine = true,
            tests = true,
            timeformat = true,
            unmarshal = true,
            unsafeptr = true,
            unusedfunc = true,
            unusedresult = true,
            waitgroup = true,
            yield = true,
            unusedvariable = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        },
      },
    })

    vim.lsp.config("rust_analyzer", {
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      root_markers = { "Cargo.toml", "rust-project.json", ".git" },
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "check",
          },
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          procMacro = {
            enable = true,
          },
          inlayHints = {
            bindingModeHints = {
              enable = false,
            },
            chainingHints = {
              enable = true,
            },
            closingBraceHints = {
              enable = true,
              minLines = 25,
            },
            closureReturnTypeHints = {
              enable = "never",
            },
            lifetimeElisionHints = {
              enable = "never",
              useParameterNames = false,
            },
            maxLength = 25,
            parameterHints = {
              enable = true,
            },
            reborrowHints = {
              enable = "never",
            },
            renderColons = true,
            typeHints = {
              enable = true,
              hideClosureInitialization = false,
              hideNamedConstructor = false,
            },
          },
        },
      },
      single_file_support = true,
    })

    vim.lsp.config("dockerls", {
      cmd = { "docker-langserver", "--stdio" },
      filetypes = { "dockerfile" },
      root_markers = { "Dockerfile", "Containerfile", ".git" },
      single_file_support = true,
    })

    vim.lsp.config("lua_ls", {
      filetypes = {
        "lua",
      },
      root_markers = {
        ".git",
        ".luacheckrc",
        ".luarc.json",
        ".luarc.jsonc",
        ".stylua.toml",
        "selene.toml",
        "selene.yml",
        "stylua.toml",
      },
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim", "require" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
      single_file_support = true,
      log_level = vim.lsp.protocol.MessageType.Warning,
    })

    vim.lsp.config("taplo", {
      cmd = { "taplo", "lsp", "stdio" },
      filetypes = { "toml" },
      root_markers = { "*.toml", ".git" },
      single_file_support = true,
    })

    vim.lsp.config("jsonls", {
      cmd = { "vscode-json-language-server", "--stdio" },
      filetypes = { "json", "jsonc" },
      root_markers = { "package.json", ".git" },
      single_file_support = true,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("marksman", {
      cmd = { "marksman", "server" },
      filetypes = { "markdown", "markdown.mdx" },
      root_markers = { "README.md", ".git" },
      single_file_support = true,
    })
  end,
}
