vim.diagnostic.config({
  signs = false,
  underline = true,
  virtual_lines = false,
  virtual_text = {
    spacing = 1,
    prefix = "●",
    hl_mode = "combine",
    source = false,
  },
  severity_sort = true,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.diagnostic.hide()
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.diagnostic.show()
  end,
})
