return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- show LSP client names
    require("lualine").setup({
      options = {
        theme = "auto",
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype", "lsp_status" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
