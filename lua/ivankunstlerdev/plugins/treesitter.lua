local treesitter = require("nvim-treesitter")
treesitter.setup()
treesitter.install({
  "lua",
  "json",
  "markdown",
  "css",
  "html",
  "javascript",
  "typescript",
  "jsx",
  "tsx",
  "yaml",
  "bash",
  "sql",
})

vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
