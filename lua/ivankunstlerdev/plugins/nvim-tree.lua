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
    }
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()
      if node.nodes ~= nil then
        api.node.open.edit()
      else
        api.node.open.vertical()
      end
      api.tree.focus()
    end

    api.map.on_attach.default(bufnr)
    vim.keymap.set("n", "l", api.node.open.edit, opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.node.collapse, opts("Close"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree_*",
  callback = function()
    vim.opt_local.statuscolumn = ""
  end,
})

vim.schedule(function()
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
    link = "Comment"
  })

  if vim.fn.argc() == 0 then
    vim.cmd("NvimTreeOpen")
  end
end)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File explorer" })
vim.keymap.set("n", "<leader><S-e>", "<cmd>NvimTreeFindFile<cr>", { desc = "Open in file explorer" })
