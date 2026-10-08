local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    backdrop = 100
  }
})

fzf.register_ui_select()

local kmap = function(keymap, fn, desc, modes)
  modes = modes or "n"
  vim.keymap.set(modes, keymap, fn, { desc = desc })
end

kmap("<leader>ff", function() fzf.files() end, "Find files")
kmap("<leader>fg", function() fzf.live_grep() end, "Find worlds")
kmap("<leader>fd", function() fzf.diagnostics_document() end, "Find diagnostics")
kmap("<leader>fD", function() fzf.diagnostics_workspace() end, "Find workspace diagnostics")

kmap("gD", function() fzf.lsp_declarations() end, "Lsp declarations")
kmap("gd", function() fzf.lsp_definitions() end, "Lsp definitions")
kmap("gi", function() fzf.lsp_implementations() end, "Lsp implementations")
kmap("gy", function() fzf.lsp_typedefs() end, "Lsp type definitions")
kmap("<leader>ca", function() fzf.lsp_code_actions() end, "Lsp code actions")
kmap("<leader>cA", function() fzf.lsp_code_actions({ context = { only = { "source" }, diagnostics = {} } }) end,
  "Lsp source actions")
