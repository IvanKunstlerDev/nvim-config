require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<C-@>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "cancel", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    ["<TAB>"] = {
      function(cmp)
        if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
          return cmp.accept()
        end
      end,
      "fallback",
    },
  },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    list = {
      selection = {
        auto_insert = false,
        preselect = true,
      },
    },
    documentation = {
      window = {
        border = "rounded",
        scrollbar = false,
      },
      auto_show = false,
    },
    menu = {
      border = "rounded",
      auto_show = false,
      scrollbar = false,
      draw = {
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
      },
    },
    ghost_text = {
      enabled = true,
    },
    accept = {
      auto_brackets = {
        enabled = false,
      },
    },
  },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  signature = { enabled = true },
})
