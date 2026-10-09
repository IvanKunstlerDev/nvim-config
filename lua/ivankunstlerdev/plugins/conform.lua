local conform = require("conform")

conform.setup({
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
    javascript = { "prettier", "biome", "oxfmt", "oxlint" },
    typescript = { "prettier", "biome", "oxfmt", "oxlint" },
    javascriptreact = { "prettier", "biome", "oxfmt", "oxlint" },
    typescriptreact = { "prettier", "biome", "oxfmt", "oxlint" },
    json = { "prettier", "biome", "jsonls" },
  },

  format_on_save = {
    timeout_ms = 5000,
  },
})

vim.keymap.set("n", "<leader>cf", function()
  conform.format({ async = true })
end, { desc = "Format code" })
