return {
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
}
