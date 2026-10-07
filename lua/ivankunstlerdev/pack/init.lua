local gh = require("ivankunstlerdev.config.utils").gh

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  { src = gh("Saghen/blink.cmp"),     version = "v1" },
  gh("folke/lazydev.nvim"),
  { src = gh("nvim-mini/mini.pairs"), version = "stable" },
  gh("neovim/nvim-lspconfig"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("nvim-tree/nvim-web-devicons"),
  gh("ibhagwan/fzf-lua"),
  gh("nvim-tree/nvim-tree.lua"),
  gh("vague-theme/vague.nvim"),
  gh("stevearc/conform.nvim"),
  gh("mfussenegger/nvim-lint")
})
