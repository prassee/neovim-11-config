-- Copilot basic
-- vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
return {
  "github/copilot.vim",
  config = function()
    -- Copilot keymaps if needed
    vim.g.copilot_no_tab_map = true
    vim.keymap.set(
      "i",
      "<S-Tab>",
      'copilot#Accept("\\<S-Tab>")',
      { expr = true, replace_keycodes = false }
    )
  end,
}
