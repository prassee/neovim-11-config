return {
  "Saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("blink.cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      fuzzy = { implementation = "lua" },
      signature = {
        enabled = true,
        trigger = {
          show_on_insert_on_trigger_character = true,
        },
      },
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
      },
    })
  end,
}
