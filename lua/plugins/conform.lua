return {
  "stevearc/conform.nvim",
config = function()
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "golines", "gofmt" },
    python = { "ruff", "black" },
  },
  format_on_save = { lsp_fallback = true },
})
end,
}