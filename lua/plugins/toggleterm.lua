return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
		})
		local opencode = Terminal:new({
			cmd = "opencode",
			direction = "float",
			hidden = true,
		})
		require("toggleterm").setup({
			shade_terminals = true,
			vim.keymap.set("n", "<leader>g", function()
				lazygit:toggle()
			end, { desc = "Toggle Lazygit" }),
			vim.keymap.set("n", "<leader>o", function()
				opencode:toggle()
			end, { desc = "Toggle Opencode" }),

			vim.api.nvim_set_keymap(
				"n",
				"<leader>t",
				":ToggleTerm direction=float<CR>",
				{ noremap = true, silent = true, desc = "Toggle floating terminal" }
			),
			vim.api.nvim_set_keymap(
				"n",
				"<leader>|",
				":ToggleTerm direction=vertical<CR>",
				{ noremap = true, silent = true, desc = "Toggle vertical terminal" }
			),
			vim.api.nvim_set_keymap(
				"n",
				"<leader>_",
				":ToggleTerm direction=horizontal<CR>",
				{ noremap = true, silent = true, desc = "Toggle horizontal terminal" }
			),
		})
	end,
}
