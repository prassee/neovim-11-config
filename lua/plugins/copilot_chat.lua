return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  config = function()
    require("CopilotChat").setup()
  end,
  keys = {
    { "<leader>zc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat", mode = "n" },
    {
      "<leader>zq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, {
            selection = require("CopilotChat.select").buffer,
          })
        end
      end,
      desc = "Open Copilot Quick Chat",
      mode = "v",
    },
    { "<leader>ze", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code", mode = "v" },
    { "<leader>zr", "<cmd>CopilotChatReview<cr>", desc = "Review Code", mode = "v" },
    { "<leader>zf", "<cmd>CopilotChatFix<cr>", desc = "Fix Code issues", mode = "v" },
    { "<leader>zo", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code", mode = "v" },
  },
}
