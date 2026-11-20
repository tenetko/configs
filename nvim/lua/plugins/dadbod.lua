return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      local function export_csv()
        local url = vim.b.db
        if not url or url == "" then
          vim.notify("No active DB connection found!", vim.log.levels.ERROR)
          return
        end

        local out = vim.fn.input("Export CSV to: ", vim.fn.expand("~/Downloads/result.csv"), "file")
        if out == "" then
          return
        end
        out = vim.fn.expand(out)

        local tmp = vim.fn.tempname() .. ".sql"
        vim.fn.writefile(vim.api.nvim_buf_get_lines(0, 0, -1, false), tmp)

        vim.notify("Exporting...", vim.log.levels.INFO)
        vim.system(
          { "usql", "--no-rc", "--no-password", "--csv", "--file", tmp, "--out", out, url },
          { text = true },
          function(res)
            vim.schedule(function()
              vim.fn.delete(tmp)
              if res.code == 0 then
                vim.notify("Exported to: " .. out, vim.log.levels.INFO)
              else
                vim.notify("Export failed:\n" .. (res.stderr or ""), vim.log.levels.ERROR)
              end
            end)
          end
        )
      end

      local group = vim.api.nvim_create_augroup("dadbod_user", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "sql", "plsql" },
        callback = function(args)
          local ok, cmp = pcall(require, "cmp")
          if ok then
            cmp.setup.buffer({
              sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
              },
            })
          end
          vim.keymap.set("n", "<Leader>E", export_csv, { buffer = args.buf, desc = "Export query result to CSV" })
        end,
      })
    end,
  },
}
