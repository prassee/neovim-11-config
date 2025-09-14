return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      shade_terminals = false,
    })
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end
    --    vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogit<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle Lazygit" })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>t",
      ":ToggleTerm direction=float<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>|",
      ":ToggleTerm direction=vertical<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>_",
      ":ToggleTerm direction=horizontal<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "v",
      "<leader><leader><Enter>",
      ":ToggleTermSendVisualSelection <CR>",
      { noremap = true, silent = true }
    )
  end,
}
