return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "golines", "gofmt" },
        python = { "ruff" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    })
  end,
}
