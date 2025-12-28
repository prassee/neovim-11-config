return {
  "viniciusteixeiradias/kanban.nvim",
  config = function()
    require("kanban").setup({
      file = {
        path = nil, -- Custom path (nil = auto-detect)
        name = "TODO.md", -- Default filename
        create_if_missing = true,
      },
      default_columns = { "Backlog", "In Progress", "Done" },
      window = {
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
      highlights = {
        column_header = { bold = true, fg = "#888888" },
        column_header_active = { bold = true, fg = "#ffffff", bg = "#3a3a3a" },
        task = { default = true },
        task_active = { fg = "#000000", bg = "#7dd3fc", bold = true },
        task_done = { strikethrough = true, fg = "#666666" },
        separator = { fg = "#444444" },
      },
      auto_refresh_buffers = true, -- Refresh open markdown buffers on changes
      on_complete_move_to = "Done", -- Target column when checked (nil to disable)
    })
  end,
}
