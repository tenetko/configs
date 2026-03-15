return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = false,
      },
    },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "show", "select_next", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
