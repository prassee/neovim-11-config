return {
  "akinsho/toggleterm.nvim",
  config = function()
require("toggleterm").setup({ shade_terminals = true })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

vim.keymap.set("n", "<leader>g", function() lazygit:toggle() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })
end,
}