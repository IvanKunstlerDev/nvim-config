return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufEnter",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "▏",
				smart_indent_cap = true,
			},
			scope = {
				enabled = false,
				show_start = false,
				show_end = false,
			},
		},
		config = true,
	},
}
