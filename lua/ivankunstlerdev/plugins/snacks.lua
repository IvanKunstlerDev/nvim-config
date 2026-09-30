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
		},
		picker = {
			enabled = true,
			files = {
				hidden = true,
			},
			sources = {
				explorer = {
					jump = { close = false },
					layout = {
						auto_hide = { "input" },
						preset = "sidebar",
						layout = {
							position = "left",
							border = "none"
						}
					},
					icons = {
						tree = {
							vertical = " ",
							middle = " ",
							last = " ",
						},
						files = {
							dir = "󱞫",
							dir_open = "󱞩"
						}
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

		local link_normal = function(hlname)
			vim.api.nvim_set_hl(0, hlname, { link = "Normal" })
		end
		vim.schedule(function()
			link_normal("SnacksPicker")
			link_normal("SnacksPickerList")
			link_normal("SnacksPickerBorder")
			link_normal("SnacksPickerTitle")
			vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { link = "NonText" })
		end)
	end,
}
