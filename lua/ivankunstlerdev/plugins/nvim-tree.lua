vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width = 34,
    number = false,
    relativenumber = false,
    side = "left",
    cursorline = false,
  },
  disable_netrw = true,
  renderer = {
    icons = {
      show = {
        bookmarks = false,
        diagnostics = false,
        folder_arrow = false,
        git = false,
        modified = false,
      },
      glyphs = {
        folder = {
          default = "󱞫",
          empty = "󱞫",
          open = "󱞩",
          empty_open = "󱞩",
        }
      }
    }
  }
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree_*",
  callback = function()
    vim.opt_local.statuscolumn = ""
  end,
})

local normalhl = vim.api.nvim_get_hl(0, { name = "Normal" })
vim.schedule(function ()
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
    bg = normalhl.bg,
    fg = normalhl.bg
  })
end)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File explorer" })
