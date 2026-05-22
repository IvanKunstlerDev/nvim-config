return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		explorer = {
			enabled = true,
			trash = true,
			replace_netrw = true,
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						preset = "sidebar",
						layout = {
							position = "left",
						},
					},
					icons = {
						tree = {
							vertical = "  ",
							middle = "  ",
							last = "  ",
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
	},
}
