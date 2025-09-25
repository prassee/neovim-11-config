vim.g.copilot_no_tab_map = true
vim.keymap.set(
  "i",
  "<S-Tab>",
  'copilot#Accept("\\<S-Tab>")',
  { expr = true, replace_keycodes = false }
)
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    config = function()
      print("CopilotChat loaded")
    end,
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat", mode = "n" },
      { "<leader>ze", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code", mode = "v" },
      { "<leader>zr", "<cmd>CopilotChatReview<cr>", desc = "Review Code", mode = "v" },
      { "<leader>zf", "<cmd>CopilotChatFix<cr>", desc = "Fix Code issues", mode = "v" },
      { "<leader>zo", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code", mode = "v" },
    },
  },
}
