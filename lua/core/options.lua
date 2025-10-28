local opt = vim.opt

opt.mouse = "a"
opt.showmode = true
-- Use xclip for clipboard
vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = "xclip -selection clipboard",
    ["*"] = "xclip -selection primary",
  },
  paste = {
    ["+"] = "xclip -selection clipboard -o",
    ["*"] = "xclip -selection primary -o",
  },
  cache_enabled = 0,
}
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = false
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10
opt.swapfile = false
opt.backup = false
opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.winborder = "rounded" -- https://neovim.io/doc/user/options.html#'winborder'
-- disable swap file
vim.opt.swapfile = false
-- disable backup file
vim.opt.backup = false
vim.g.copilot_no_tab_map = true
