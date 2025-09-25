return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("mason-nvim-dap").setup({
      -- Ensure the debug adapters you need are installed
      ensure_installed = { "codelldb", "debugpy" },
    })
  end,
}
