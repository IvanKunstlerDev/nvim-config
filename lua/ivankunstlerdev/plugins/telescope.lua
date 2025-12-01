return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	config = true,
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope find files" } },
		{ "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope live grep" } },
		{ "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope buffers" } },
		{ "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Telescope help tags" } },
	},
}
