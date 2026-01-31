return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			keymaps = {
				["q"] = { "actions.close", mode = "n" },
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return name == ".git" or name == ".."
				end,
			},
		},
		config = function(_, opts)
			require("oil").setup(opts)

			local map = vim.keymap.set
			map("n", "-", "<cmd>Oil<cr>", { desc = "Open file explorer." })
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			filters = { dotfiles = false },
			disable_netrw = true,
			hijack_cursor = true,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				width = 32,
				preserve_window_proportions = true,
				signcolumn = "yes",
			},
			git = { enable = true },
			diagnostics = { enable = true },
			renderer = {
				root_folder_label = false,
				highlight_git = "name",
				highlight_diagnostics = "icon",
				highlight_hidden = "name",
				indent_markers = { enable = false },
				icons = {
					diagnostics_placement = "signcolumn",
					show = {
						folder_arrow = false,
						git = false,
					},
					glyphs = {
						default = "󰈚",
						folder = {
							default = "󰉋",
							empty = "󰉋",
							empty_open = "󰉋",
							open = "󰝰",
							symlink = "󱁽",
						},
						git = { unmerged = "" },
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			local map = vim.keymap.set

			map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		end,
	},
}
