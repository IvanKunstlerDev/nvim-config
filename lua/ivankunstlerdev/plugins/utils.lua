return {
	{
		"nvim-mini/mini.move",
		version = "*",
		config = true,
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"NMAC427/guess-indent.nvim",
		lazy = false,
		config = true,
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "BufNewFile", "BufReadPre " },
		opts = {},
		config = true,
	},

	{
		"aserowy/tmux.nvim",
		opts = {
			copy_sync = {
				enable = false,
			},
			navigation = {
				cycle_navigation = true,
				enable_default_keybindings = true,
				persist_zoom = false,
			},
			resize = {
				enable_default_keybindings = false,
				resize_step_x = 2,
				resize_step_y = 2,
			},
			swap = {
				enable_default_keybindings = false,
			},
		},
		config = function(_, opts)
			require("tmux").setup(opts)
			local map = vim.keymap.set
			map("n", "<C-M-h>", "<cmd>lua require('tmux').resize_left()<cr>")
			map("n", "<C-M-j>", "<cmd>lua require('tmux').resize_bottom()<cr>")
			map("n", "<C-M-k>", "<cmd>lua require('tmux').resize_top()<cr>")
			map("n", "<C-M-l>", "<cmd>lua require('tmux').resize_right()<cr>")
		end,
	},
}
