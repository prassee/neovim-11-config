vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", ":wqall<CR>") -- vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>e", ":Ex<cr>", { desc = "Open [E]xplorer" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc><cmd>w<CR>")
vim.keymap.set("n", "<leader><leader>l", "<cmd>Lazy<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>")

vim.keymap.set({ "n", "i" }, "<leader>a", "<Esc>^i<Esc>")
vim.keymap.set({ "n", "i" }, "<leader>e", "<End>")

-- go between prev & next visited buffer
vim.keymap.set("n", "<M-S-left>", "<Esc>:bprevious<Esc>")
vim.keymap.set("n", "<M-S-right>", "<Esc>:bnext<Esc>")

vim.keymap.set("n", "<M-left>", "g;")
vim.keymap.set("n", "<M-right>", "g,")

vim.keymap.set("n", "<M-down>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<M-up>", ":m .-2<CR>==") -- move line down(n)
