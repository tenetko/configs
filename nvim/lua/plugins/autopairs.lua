return {
  "nvim-mini/mini.pairs", -- Use the new name
  opts = function(_, opts)
    opts.mappings = opts.mappings or {}

    -- Disable the backtick mapping
    opts.mappings["`"] = false
  end,
}
