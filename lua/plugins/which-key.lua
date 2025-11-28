return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      -- this is a comment line
      preset = "helix",
    })
  end,
}
