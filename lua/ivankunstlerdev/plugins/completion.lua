return {
	"saghen/blink.cmp",
	dependencies = { { "folke/lazydev.nvim" }, { "L3MON4D3/LuaSnip", version = "v2.*" } },
	event = "VimEnter",
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "cancel", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			["<TAB>"] = {
				function(cmp)
					if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
						return cmp.accept()
					end
				end,
				"fallback",
			},
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			list = {
				selection = {
					auto_insert = false,
					preselect = true,
				},
			},
			documentation = {
				window = {
					border = "rounded",
					scrollbar = false,
				},
				auto_show = false,
			},
			menu = {
				border = "rounded",
				auto_show = false,
				scrollbar = false,
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
				},
			},
			ghost_text = {
				enabled = true,
			},
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },

		snippets = { preset = "luasnip" },
	},
	opts_extend = { "sources.default" },
}
