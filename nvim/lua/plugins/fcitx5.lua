return {
  "keaising/im-select.nvim",
  config = function()
    -- require("im_select").setup({})
    local script_path = os.getenv("HOME") .. "/.config/sway/im-select-sway.sh"

    require("im_select").setup({
      default_im_select = "0",
      default_command = script_path,
      set_default_events = { "VimEnter", "InsertLeave", "CmdlineLeave" },
      set_previous_events = { "InsertEnter" },
      keep_quiet_on_no_binary = true,
    })
  end,
}
