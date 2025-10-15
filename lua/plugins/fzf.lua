return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup()
    fzf.register_ui_select()

    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fF", function()
      require("fzf-lua").global()
    end, { desc = "Find files (cwd)" })
    vim.keymap.set("n", "<leader>fG", fzf.live_grep, { desc = "Grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fr", fzf.lsp_references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>fd", fzf.lsp_definitions, { desc = "LSP Definitions" })
    vim.keymap.set("n", "<leader>fca", fzf.lsp_code_actions, { desc = "LSP Code Actions" })
    vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "LSP Document Symbols" })
    vim.keymap.set("n", "<leader>fw", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>fR", vim.lsp.buf.rename, { desc = "LSP rename" })
    -- show workspace diagnostics
    vim.keymap.set(
      "n",
      "<leader>fD",
      ":FzfLua lsp_workspace_diagnostics<CR>",
      { desc = "LSP Workspace Diagnostics" }
    )
    vim.keymap.set("n", "<leader>fA", ":FzfLua lsp_code_actions<CR>", { desc = "LSP Code Actions" })
    -- configure keymap to open fzf-lua's git status
    vim.keymap.set("n", "<leader>fgs", fzf.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>fgc", fzf.git_commits, { desc = "Git Commits" })
    -- keymap to list all commands
    vim.keymap.set("n", "<leader>fC", fzf.commands, { desc = "Commands" })
  end,
}
