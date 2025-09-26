vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", ":wqall<CR>", { desc = "Quit" }) -- vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>e", ":Ex<cr>", { desc = "Open [E]xplorer" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "[S]ave file" })
vim.keymap.set("n", "<leader><leader>l", "<cmd>Lazy<CR>", { desc = "Open [L]azy" })
vim.keymap.set({ "n", "i" }, "<leader>a", "<Esc>^i<Esc>", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "i" }, "<leader>e", "<End>", { desc = "Go to end of line" })

-- go between prev & next visited buffer
vim.keymap.set(
  "n",
  "<M-S-left>",
  "<Esc>:bprevious<Esc>",
  { desc = "Go to previous visited buffer" }
)
vim.keymap.set("n", "<M-S-right>", "<Esc>:bnext<Esc>", { desc = "Go to next visited buffer" })

vim.keymap.set("n", "<M-left>", "g;", { desc = "Go to older cursor position" })
vim.keymap.set("n", "<M-right>", "g,", { desc = "Go to newer cursor position" })

vim.keymap.set("n", "<M-down>", ":m .+1<CR>==", { desc = "Move line up" }) -- move line up(n)
vim.keymap.set("n", "<M-up>", ":m .-2<CR>==", { desc = "Move line down" }) -- move line down(n)
