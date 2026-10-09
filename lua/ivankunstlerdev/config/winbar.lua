local function winbar()
  local numberwidth = vim.o.numberwidth
  local signcolumn = vim.o.signcolumn == "no" and 0 or 2
  local left_margin = 0
  local padding = string.rep(" ", numberwidth + signcolumn + left_margin)

  local filename = vim.fn.expand("%:t")
  if filename == "" then
    return padding .. "Empty"
  end

  local modified_hl = vim.bo.modified and "%#WinBarModified#" or ""

  local icon, icon_hl = require("nvim-web-devicons").get_icon(filename, nil, { default = true })
  local colored_icon = "%#" .. icon_hl .. "#" .. icon .. " %*"

  return padding .. colored_icon .. modified_hl .. vim.fn.expand("%")
end

local function set_hl()
  local hl = vim.api.nvim_get_hl(0, { name = "Comment" })
  ---@diagnostic disable-next-line: assign-type-mismatch
  hl.italic = false
  ---@diagnostic disable-next-line: param-type-mismatch
  vim.api.nvim_set_hl(0, "WinBar", hl)
  ---@diagnostic disable-next-line: param-type-mismatch
  vim.api.nvim_set_hl(0, "WinBarNC", hl)

  local modified_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
  modified_hl.italic = true
  ---@diagnostic disable-next-line: param-type-mismatch
  vim.api.nvim_set_hl(0, "WinBarModified", modified_hl)
end

set_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_hl,
})

vim.api.nvim_create_autocmd(
  { "VimEnter", "BufEnter", "BufModifiedSet", "WinEnter", "WinLeave", "DiagnosticChanged" },
  {
    callback = function()
      if vim.bo.buftype == "terminal" or vim.bo.buftype == "nofile" then
        vim.api.nvim_set_option_value("winbar", "", { scope = "local" })
        return
      end
      vim.api.nvim_set_option_value("winbar", winbar(), { scope = "local" })
    end,
  }
)
