--[[ return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- transparent = true,
      -- styles = { sidebars = "transparent", floats = "transparent" },
    })
    vim.cmd.colorscheme("tokyonight-storm")
  end,
} ]]

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "soft", -- can be "hard", "soft" or empty string
      overrides = {
        Normal = { bg = "#1d2021" },
        NormalFloat = { bg = "#1d2021" },
        FloatBorder = { bg = "#1d2021", fg = "#458588" },
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
