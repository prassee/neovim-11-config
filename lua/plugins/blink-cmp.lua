return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	-- opts = {
	-- 	keymap = { preset = "default" },
	-- 	appearance = {
	-- 		use_nvim_cmp_as_default = true,
	-- 		nerd_font_variant = "mono",
	-- 	},
	-- 	sources = {
	-- 		default = { "lsp", "path", "snippets", "buffer" },
	-- 	},
	-- 	completion = {
	-- 		accept = {
	-- 			auto_brackets = {
	-- 				enabled = true,
	-- 			},
	-- 		},
	-- 		menu = {
	-- 			auto_show = true,
	-- 			draw = {
	-- 				treesitter = { "lsp" },
	-- 			},
	-- 		},
	-- 		documentation = {
	-- 			auto_show = true,
	-- 			auto_show_delay_ms = 200,
	-- 		},
	-- 	},
	-- 	signature = {
	-- 		enabled = true,
	-- 	},
	-- },
	-- opts_extend = { "sources.default" },
	config = function(_, opts)
		require("blink.cmp").setup({

			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-up>"] = { "scroll_documentation_up", "fallback" },
				["<C-down>"] = { "scroll_documentation_down", "fallback" },
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					window = {
						border = nil,
						scrollbar = false,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					},
				},
				menu = {
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" }, { "source_name" } },
					},
				},
			},
		})
	end,
}
