local lint = require("lint")

lint.linters_by_ft = {
  javascript = {
    "eslint_d",
    "biomejs",
    "oxlint",
  },
  typescript = {
    "eslint_d",
    "biomejs",
    "oxlint",
  },
  javascriptreact = {
    "eslint_d",
    "biomejs",
    "oxlint",
  },
  typescriptreact = {
    "eslint_d",
    "biomejs",
    "oxlint",
  },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n",
  group = lint_augroup,
  callback = function()
    lint.try_lint(nil, { ignore_errors = true })
  end,
})
