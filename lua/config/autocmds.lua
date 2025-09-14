vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, { desc = "LSP: Find references/usages" })

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, { desc = "LSP: Go to definition" })

    vim.keymap.set("n", "gD", function()
      vim.lsp.buf.declaration()
    end, { desc = "LSP: Go to declaration" })

    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, { desc = "LSP: Go to implementation" })

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, { desc = "LSP: Hover (documentation)" })
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "LSP: Format buffer" })

    -- Document Symbols (symbols in the current buffer, e.g., functions, classes)
    vim.keymap.set("n", "<leader>ds", function()
      vim.lsp.buf.document_symbol()
    end, { desc = "LSP: Document symbols" })

    -- Workspace Symbols (symbols across the whole project/workspace)
    vim.keymap.set("n", "<leader>ws", function()
      vim.lsp.buf.workspace_symbol()
    end, { desc = "LSP: Workspace symbols" })

    vim.keymap.set("n", "<F2>", function()
      vim.lsp.buf.rename()
    end, { desc = "LSP: Rename symbol" })

    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, { desc = "LSP: Code actions" })
    -- local map = function(keys, func, desc)
    --  vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    -- end

    -- defaults:
    -- https://neovim.io/doc/user/news-0.11.html#_defaults

    -- map("<leader>d", vim.diagnostic.open_float, "Open Diagnostic Float")
    -- map("K", vim.lsp.buf.hover, "Hover Documentation")
    -- map("gS", vim.lsp.buf.signature_help, "Signature Documentation")
    -- map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    -- map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    -- map("<leader>rn", vim.lsp.buf.rename, "Rename all references")
    -- map("<leader>f", vim.lsp.buf.format, "Format")
    -- map(
    -- "<leader>v",
    -- "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
    -- "Goto Definition in Vertical Split"
    -- )

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has("nvim-0.11") == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if
      client
      and client_supports_method(
        client,
        vim.lsp.protocol.Methods.textDocument_documentHighlight,
        event.buf
      )
    then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

      -- When cursor stops moving: Highlights all instances of the symbol under the cursor
      -- When cursor moves: Clears the highlighting
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- When LSP detaches: Clears the highlighting
      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
        end,
      })
    end
  end,
})
