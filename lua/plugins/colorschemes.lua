-- return {
--   "vague2k/vague.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other plugins
--   config = function()
--     -- NOTE: you do not need to call setup if you don't want to.
--     require("vague").setup({
--       -- optional configuration here
--     })
--     vim.cmd("colorscheme vague")
--   end,
--
-- }

-- return {
--   "darianmorat/gruvdark.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("gruvdark").setup({
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--     })
--     vim.cmd("colorscheme gruvdark")
--   end,
-- }
--
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup()
    vim.cmd.colorscheme("catppuccin")
  end,
}
