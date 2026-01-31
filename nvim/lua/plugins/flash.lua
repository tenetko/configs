return {
  "folke/flash.nvim",
  keys = {
    -- Disable the default 's' and 'S' mappings
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },

    -- Optional: Map Flash to 'gw' or something else if you still want to use it
    -- { "gw", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
