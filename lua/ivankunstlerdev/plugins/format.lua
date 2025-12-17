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
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettier", stop_after_first = true },
			typescript = { "prettier", stop_after_first = true },
			javascriptreact = { "prettier", stop_after_first = true },
			typescriptreact = { "prettier", stop_after_first = true },
		},
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
	},
}
