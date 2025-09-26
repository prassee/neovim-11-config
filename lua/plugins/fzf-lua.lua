return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Fuzzy [F]ind files",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").global()
      end,
      desc = "Fuzzy [G]lobal search",
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Fuzzy [B]uffer search",
    },
    {
      "<leader>fp",
      function()
        require("fzf-lua").grep()
      end,
      desc = "Find Files in project directory",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").commands()
      end,
      desc = "Fuzzy [C]ommand search",
    },
    -- lsp references
    {
      "<leader>fr",
      function()
        require("fzf-lua").lsp_references()
      end,
      desc = "LSP [R]eferences",
    },
    -- lsp definitions
    {
      "<leader>fd",
      function()
        require("fzf-lua").lsp_definitions()
      end,
      desc = "LSP [D]efinitions",
    },
    -- lsp implementations
    {
      "<leader>fi",
      function()
        require("fzf-lua").lsp_implementations()
      end,
      desc = "LSP [I]mplementations",
    },
    -- lsp document symbols
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "LSP Document [S]ymbols",
    },
    -- lsp workspace symbols
    {
      "<leader>fS",
      function()
        require("fzf-lua").lsp_workspace_symbols()
      end,
      desc = "LSP Workspace [S]ymbols",
    },
    -- fzf resume
    {
      "<leader>fr",
      function()
        require("fzf-lua").resume()
      end,
      desc = "[R]esume last fzf-lua picker",
    },
    -- lsp workspace diagnostics picker
    {
      "<leader>fD",
      function()
        require("fzf-lua").lsp_workspace_diagnostics()
      end,
      desc = "LSP Workspace [D]iagnostics",
    },
    -- LSP code actions picker
    {
      "<leader>fA",
      function()
        require("fzf-lua").lsp_code_actions()
      end,
      desc = "LSP [A]ctions",
    },
  },
}
