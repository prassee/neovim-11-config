return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom",
						ratio = 0.4,
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node",
				server_opts_overrides = {},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			question_header = "## User ",
			answer_header = "## Copilot ",
			error_header = "## Error ",
			prompts = {
				Explain = {
					mapping = "<leader>ce",
					description = "AI Explain",
				},
				Review = {
					mapping = "<leader>cr",
					description = "AI Review",
				},
				Tests = {
					mapping = "<leader>ct",
					description = "AI Tests",
				},
				Fix = {
					mapping = "<leader>cf",
					description = "AI Fix",
				},
				Optimize = {
					mapping = "<leader>co",
					description = "AI Optimize",
				},
				Docs = {
					mapping = "<leader>cd",
					description = "AI Documentation",
				},
				FixDiagnostic = {
					mapping = "<leader>cfd",
					description = "AI Fix Diagnostic",
				},
				Commit = {
					mapping = "<leader>cc",
					description = "AI Commit",
				},
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")

			opts.selection = select.visual

			chat.setup(opts)

			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*" })

			local keymap = vim.keymap.set
			keymap("n", "<leader>ccb", ":CopilotChatBuffer ", { desc = "CopilotChat - Chat with current buffer" })
			keymap("n", "<leader>cce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
			keymap("n", "<leader>cct", "<cmd>CopilotChatTests<cr>", { desc = "CopilotChat - Generate tests" })
			keymap("v", "<leader>ccv", ":CopilotChatVisual ", { desc = "CopilotChat - Open in vertical split" })
			keymap("v", "<leader>ccx", ":CopilotChatInline<cr>", { desc = "CopilotChat - Inline chat" })
			keymap("n", "<leader>ccf", "<cmd>CopilotChatFixDiagnostic<cr>", { desc = "CopilotChat - Fix Diagnostic" })
			keymap(
				"n",
				"<leader>ccr",
				"<cmd>CopilotChatReset<cr>",
				{ desc = "CopilotChat - Reset chat history and clear buffer" }
			)
			keymap("n", "<leader>ccs", "<cmd>CopilotChatSave<cr>", { desc = "CopilotChat - Save chat to file" })
			keymap("n", "<leader>ccl", "<cmd>CopilotChatLoad<cr>", { desc = "CopilotChat - Load chat from file" })
		end,
		event = "VeryLazy",
		keys = {
			{ "<leader>cch", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		},
	},
}
