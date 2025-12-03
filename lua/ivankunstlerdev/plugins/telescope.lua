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
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "fzf")
	end,
}
