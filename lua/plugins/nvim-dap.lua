return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- Add other DAP related plugins like nvim-dap-virtual-text if desired
  },
  config = function()
    require("dapui").setup()
    -- Further dap configuration can go here
  end,
}
