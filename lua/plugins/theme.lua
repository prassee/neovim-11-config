-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "frappe",
--       transparent_background = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         treesitter = true,
--         which_key = true,
--       },
--     })
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }

-- return {
--   "darianmorat/gruvdark.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd.colorscheme("gruvdark")
--   end,
-- }

return {
  "adibhanna/forest-night.nvim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme forest-night]])
  end,
}

-- return {
--   "abhilash26/mapledark.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("mapledark")
--   end,
-- }

-- vim.cmd.colorscheme("prasiodark")
-- return {}
