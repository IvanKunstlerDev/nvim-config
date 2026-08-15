return {
	{
		"ahmadinne/paradise.nvim",
		enabled = true,
		lazy = false,
		config = function()
			require("paradise").setup({
				italic_comments = true,
				transparent = false,
			})
			vim.cmd.colorscheme("paradise")

			local set_italic_hl = function(hl_name, value)
				local prev_hl = vim.api.nvim_get_hl(0, { name = hl_name })
				vim.api.nvim_set_hl(0, hl_name, vim.tbl_extend("force", prev_hl, { italic = value }))
			end
			set_italic_hl("@keyword", true)
			set_italic_hl("@keyword.import", true)
			set_italic_hl("@keyword.conditional", true)
			set_italic_hl("@keyword.return", true)
			set_italic_hl("@keyword.repeat", true)
			set_italic_hl("@lsp.type.function", true)
			set_italic_hl("@lsp.type.method", true)
			set_italic_hl("@constructor", true)
			set_italic_hl("@variable", false)
			set_italic_hl("@lsp.type.variable", false)
			set_italic_hl("@lsp.mod.readonly", false)
			set_italic_hl("@lsp.typemod.variable.readonly", false)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = true,
		opts = {
			undercurl = true,
			commentStyle = { italic = true },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			typeStyle = { bold = false },
			transparent = false,
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
}
