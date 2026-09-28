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
			hidden = true,
			win = {
				padding = {
					left = 1,
					right = 1,
				},
			},
		},
		picker = {
			enabled = true,
			files = {
				hideen = true,
			},
			sources = {
				explorer = {
					jump = { close = false }, -- Cerrar al seleccionar un archivo
					layout = {
						preset = "sidebar",
						layout = {
							position = "right",
						},
					},
					icons = {
						tree = {
							vertical = " ",
							middle = " ",
							last = " ",
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
	config = function(_, opts)
		require("snacks").setup(opts)

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					require("snacks").explorer()
				end
			end,
		})
	end,
}
