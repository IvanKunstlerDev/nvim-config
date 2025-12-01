return {
	{
		"rcarriga/nvim-notify",
		opts = {
			render = "default",
			stages = "static",
		},
		config = true,
	},

	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		config = true,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "f4z3r/gruvbox-material.nvim" },
		config = function()
			local theme = require("gruvbox-material.lualine").theme("medium")

			require("lualine").setup({
				options = { theme = theme },
			})
		end,
	},
}
