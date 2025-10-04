return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				preview = {
					scrollbar = "float",
				},
				fullscreen = false,
				vertical = "down:45%",
				horizontal = "right:60%",
				hidden = "nohidden",
			},
			keymap = {
				builtin = {
					["<F1>"] = "toggle-help",
					["<F2>"] = "toggle-fullscreen",
					["<F3>"] = "toggle-preview-wrap",
					["<F4>"] = "toggle-preview",
					["<F5>"] = "toggle-preview-ccw",
					["<F6>"] = "toggle-preview-cw",
					["<S-down>"] = "preview-page-down",
					["<S-up>"] = "preview-page-up",
					["<S-left>"] = "preview-page-reset",
				},
				fzf = {
					["ctrl-z"] = "abort",
					["ctrl-u"] = "unix-line-discard",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
					["f3"] = "toggle-preview-wrap",
					["f4"] = "toggle-preview",
					["shift-down"] = "preview-page-down",
					["shift-up"] = "preview-page-up",
				},
			},
			previewers = {
				cat = {
					cmd = "cat",
					args = "--number",
				},
				bat = {
					cmd = "bat",
					args = "--style=numbers,changes --color always",
					theme = "Coldark-Dark",
				},
				head = {
					cmd = "head",
					args = nil,
				},
				git_diff = {
					cmd_deleted = "git show HEAD:./%s",
					cmd_modified = "git diff HEAD %s",
					cmd_untracked = "git diff --no-index /dev/null %s",
				},
			},
			files = {
				prompt = "Files❯ ",
				multiprocess = true,
				git_icons = true,
				file_icons = true,
				color_icons = true,
				find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
				rg_opts = [[--color=never --files --hidden --follow -g "!.git"]],
				fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
			},
			grep = {
				prompt = "Rg❯ ",
				input_prompt = "Grep For❯ ",
				multiprocess = true,
				git_icons = true,
				file_icons = true,
				color_icons = true,
				rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e]],
				grep_opts = [[--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e]],
			},
		})

		local keymap = vim.keymap.set
		keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "[S]earch [F]iles" })
		keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "[S]earch [H]elp" })
		keymap("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "[S]earch current [W]ord" })
		keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "[S]earch by [G]rep" })
		keymap("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "[S]earch [D]iagnostics" })
		keymap("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "[S]earch [R]esume" })
		keymap("n", "<leader>s.", "<cmd>FzfLua oldfiles<cr>", { desc = '[S]earch Recent Files ("." for repeat)' })
		keymap("n", "<leader><leader>", "<cmd>FzfLua buffers<cr>", { desc = "[ ] Find existing buffers" })
		keymap("n", "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", { desc = "[/] Fuzzily search in current buffer" })
		keymap("n", "<leader>s/", "<cmd>FzfLua live_grep<cr>", { desc = "[S]earch [/] in Open Files" })
		keymap("n", "<leader>sn", "<cmd>FzfLua files cwd=~/.config/nvim<cr>", { desc = "[S]earch [N]eovim files" })
	end,
}

