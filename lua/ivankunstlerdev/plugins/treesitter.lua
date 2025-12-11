return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			highlight = { enable = true },
			incremental_selection = { enable = true },
			textobjects = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"json",
				"typescript",
				"javascript",
				"bash",
				"regex",
			},
		},
	},
}
