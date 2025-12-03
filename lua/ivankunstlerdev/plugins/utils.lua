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
}
