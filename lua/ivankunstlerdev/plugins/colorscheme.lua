return {
	{
		"f4z3r/gruvbox-material.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			italics = true,
			comments = {
				italics = true,
			},
		},
		config = function(_, opts)
			require("gruvbox-material").setup(opts)
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = true,
		lazy = false,
		opts = {
			undercurl = true,
			commentStyle = { italic = true },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			typeStyle = { bold = false },
			transparent = true,
			terminalColors = true,
			overrides = function(colors)
				return {
					Boolean = { fg = colors.theme.syn.constant, bold = false },
					["@lsp.typemod.method.readonly"] = { bold = false },
					["@lsp.typemod.function.readonly"] = { bold = false },
					["@lsp.typemod.variable.readonly"] = { bold = false },
				}
			end,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd.colorscheme("kanagawa-dragon")
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222020" })

			local highlights = {
				"SignColumn", -- Columna de signos (Git, LSP)
				"LineNr", -- Números de línea
				"CursorLineNr", -- Número de línea donde está el cursor
				"GitSignsAdd",
				"GitSignsChange",
				"GitSignsRemove",
			}

			for _, group in ipairs(highlights) do
				local prev_hl = vim.api.nvim_get_hl(0, { name = group })
				local new_hl = vim.tbl_extend("force", prev_hl, { bg = "none", ctermbg = "none" })
				vim.api.nvim_set_hl(0, group, new_hl)
			end
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		enabled = false,
		lazy = false,
		opts = {
			options = {
				transparent = true,
				styles = {
					comments = "italic",
				},
			},
		},
		config = function(_, opts)
			require("github-theme").setup(opts)
			vim.cmd("colorscheme github_dark_default")
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#21262d" })
		end,
	},
}
