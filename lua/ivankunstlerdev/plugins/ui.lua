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
			"nvim-telescope/telescope.nvim",
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
		config = function(_, opts)
			require("noice").setup(opts)
			local map = vim.keymap.set
			map("n", "<leader>fN", "<CMD>Telescope notify<CR>", { desc = "Telescope notifications" })
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "f4z3r/gruvbox-material.nvim" },
		config = function()
			local theme = require("gruvbox-material.lualine").theme("medium")

			require("lualine").setup({
				options = { theme = theme, globalstatus = true },
			})
		end,
	},

	{
		"karb94/neoscroll.nvim",
		enabled = false,
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				indicator = { style = "none" },
				diagnostics = "nvim_lsp",
				diagnostics_update_on_event = true,
				offsets = {
					{
						filetype = "NvimTree",
						separator = true,
						text = "File Explorer",
					},
				},
			},
		},
		config = true,
	},
}
