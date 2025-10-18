return {
  "nvim-neotest/neotest",
  ft = { "go", "rust", "python", "cs", "typescript", "javascript" },

  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    {
      "fredrikaverpil/neotest-golang",
      version = "*", -- Optional, but recommended; track releases
      build = function()
        vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
      end,
    },
  },
  keys = {
    { "<leader>tr", "<cmd>Neotest run <cr>", desc = "run nearest test" },
    { "<leader>tl", "<cmd>Neotest run last<cr>", desc = "run last test" },
    { "<leader>tf", "<cmd>Neotest run file<cr>", desc = "run test file" },
  },
  config = function()
    local neotest = require("neotest")
    local config = {
      runner = "gotestsum", -- Optional, but recommended
    }
    neotest.setup({
      output = {
        enabled = true,
        open_on_run = "yes",
      },
      adapters = {
        require("neotest-python")({
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          -- Command line arguments for runner
          -- Can also be a function to return dynamic values
          args = { "--log-level", "DEBUG" },
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          runner = "pytest",
          python = ".venv/bin/python",
        }),
        require("neotest-golang")(config),
      },
      diagnostic = {
        enabled = true,
      },
      floating = {
        border = "rounded",
      },
    })
  end,
}
