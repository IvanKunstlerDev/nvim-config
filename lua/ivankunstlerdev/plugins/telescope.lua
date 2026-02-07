return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope find files" } },
		{ "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope live grep" } },
		{ "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope buffers" } },
		{ "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Telescope help tags" } },
	},
	opts = {
		defaults = {
			prompt_title = false,
			results_title = false,
			preview_title = false,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			prompt_prefix = " 󰍉  ",
			selection_caret = "  ",
			entry_prefix = "  ",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		pcall(telescope.load_extension, "ui-select")
		pcall(telescope.load_extension, "fzf")
	end,
}
