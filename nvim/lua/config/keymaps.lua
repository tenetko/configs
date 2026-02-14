-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- F5: Continue (Start / Resume)
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug: Continue" })

-- F8: Step Over (Next line)
map("n", "<F8>", function()
  require("dap").step_over()
end, { desc = "Debug: Step Over" })

-- F7: Step Into (Inside function)
map("n", "<F7>", function()
  require("dap").step_into()
end, { desc = "Debug: Step Into" })

-- F12: Step Out (Return from function)
map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debug: Step Out" })

-- Leader+db: Toggle Breakpoint (Keep this, it's handy)
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })
