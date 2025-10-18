-- Leader keys (must be before plugins)
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Load core settings
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap lazy.nvim and plugins
-- require("plugins")
--
local config_data_path = vim.fn.stdpath("data")
local lazypath = config_data_path .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "plugins" } })
print("Loaded plugins!")
