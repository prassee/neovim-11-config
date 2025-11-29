return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "golines", "gofmt" },
        python = { "black" },
        toml = { "taplo" },
        json = { "prettier" },
        jsonc = { "prettier" },
        markdown = { "prettier" },
      },
      format_on_save = { lsp_fallback = true },
    })
  end,
}
