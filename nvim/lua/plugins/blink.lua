return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Ensure the sources table exists
    opts.sources = opts.sources or {}

    -- 1. Default for code: Keep snippets
    -- This allows you to still use "func" -> function template in Go.
    opts.sources.default = { "lsp", "path", "snippets" }

    -- 2. For markdown and text: Remove 'snippets'
    opts.sources.per_filetype = opts.sources.per_filetype or {}

    -- We only keep "path" (for file paths) and "lsp" (in case you want autocompletion inside code blocks).
    -- We removed "snippets" and "buffer".
    opts.sources.per_filetype.markdown = { "lsp", "path" }
    opts.sources.per_filetype.text = { "lsp", "path" }
  end,
}
