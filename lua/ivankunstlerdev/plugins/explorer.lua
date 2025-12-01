return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["q"] = { "actions.close", mode = "n" },
		},
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				return name == ".git" or name == ".."
			end,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)

		local map = vim.keymap.set
		map("n", "-", "<cmd>Oil<cr>", { desc = "Open file explorer." })
	end,
}
