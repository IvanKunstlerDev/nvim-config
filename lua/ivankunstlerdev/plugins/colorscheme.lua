return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		opts = {
			italics = true,
			comments = {
				italics = true,
			},
		},
		config = function(_, opts)
			require("gruvbox-material").setup(opts)
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
