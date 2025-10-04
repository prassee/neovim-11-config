return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  config = function()
    require("CopilotChat").setup()

    vim.keymap.set("n", "<leader>zc", "<cmd>CopilotChat<cr>", { desc = "Open Chat" })
    vim.keymap.set("v", "<leader>ze", "<cmd>CopilotChatExplain<cr>", { desc = "Explain Code" })
  end,
}
