return {
	{
		"f4z3r/gruvbox-material.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			italics = true,
			comments = {
				italics = true,
			},
		},
		-- config = function(_, opts)
		-- 	require("gruvbox-material").setup(opts)
		-- 	vim.cmd.colorscheme("gruvbox-material")
		-- end,
	},
	{
		"projekt0n/github-nvim-theme",
		enabled = true,
		lazy = false,
		config = function(_, opts)
			require("github-theme").setup(opts)
			vim.cmd("colorscheme github_dark_default")
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#21262d" })
		end,
	},
}
