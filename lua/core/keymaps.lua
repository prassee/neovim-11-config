-- Global Keymaps

-- Saving and Quitting
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":wqall<CR>", { desc = "Quit" })

-- Search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigation: Lines
vim.keymap.set({ "n", "i" }, "<leader>a", "<Esc>^i<Esc>", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "i" }, "<leader>e", "<End>", { desc = "Go to end of line" })

-- Navigation: Jumplist
vim.keymap.set("n", "<M-left>", "g;", { desc = "Go to older cursor position" })
vim.keymap.set("n", "<M-right>", "g,", { desc = "Go to newer cursor position" })

-- Navigation: Buffers
vim.keymap.set(
  "n",
  "<M-S-left>",
  "<Esc>:bprevious<Esc>",
  { desc = "Go to previous visited buffer" }
)
vim.keymap.set("n", "<M-S-right>", "<Esc>:bnext<Esc>", { desc = "Go to next visited buffer" })

-- Window Management
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close Split" })
vim.keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "Keep Only This Split" })

-- Editing: Move Lines
vim.keymap.set("n", "<M-down>", ":m .+1<CR>==", { desc = "Move line up" }) -- move line up(n)
vim.keymap.set("n", "<M-up>", ":m .-2<CR>==", { desc = "Move line down" }) -- move line down(n)

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Tools / Plugins
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil File Explorer" })
vim.keymap.set("n", "<leader><leader>l", "<cmd>Lazy<CR>", { desc = "Open [L]azy" })
