return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Explicitly define the sources you want.
    -- We leave out "buffer" to stop word suggestions from the file.
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" }, -- Suggestions from the language server (code)
      { name = "luasnip" }, -- Snippets
      { name = "path" }, -- File paths
    })
  end,
}
