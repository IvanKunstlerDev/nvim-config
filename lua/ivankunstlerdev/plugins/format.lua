return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n",
			desc = "Format code",
		},
	},
	config = true,
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		notify_no_formatters = false,
		notify_on_error = true,

		default_format_opts = {
			stop_after_first = true,
			lsp_format = "fallback",
			quiet = false,
		},

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettier", "biome" },
			typescript = { "prettier", "biome" },
			javascriptreact = { "prettier", "biome" },
			typescriptreact = { "prettier", "biome" },
			json = { "prettier", "biome", "jsonls" },
		},

		format_on_save = {
			timeout_ms = 5000,
		},
	},
}
