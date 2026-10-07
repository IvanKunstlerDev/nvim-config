local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    backdrop = 100
  }
})

local kmap = function (keymap, fn, desc, modes)
  modes = modes or "n"
  vim.keymap.set(modes, keymap, fn, { desc = desc })
end

kmap("<leader>ff", function() fzf.files() end, "Find files")
kmap("<leader>fg", function() fzf.live_grep() end, "Find worlds")
kmap("<leader>fx", function() fzf.diagnostics_document() end, "Find diagnostics")
kmap("<leader>fX", function() fzf.diagnostics_workspace() end, "Find workspace diagnostics")

kmap("<leader>gd", function() fzf.lsp_declarations() end, "Lsp declarations")
kmap("<leader>gD", function() fzf.lsp_definitions() end, "Lsp definitions")
kmap("<leader>gi", function() fzf.lsp_implementations() end, "Lsp implementations")
