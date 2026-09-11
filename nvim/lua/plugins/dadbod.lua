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
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function(args)
          local cmp_ok, cmp = pcall(require, "cmp")
          if cmp_ok then
            cmp.setup.buffer({
              sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
              },
            })
          end

          vim.keymap.set("n", "<Leader>E", function()
            local db = vim.b.db
            if not db then
              vim.notify("No active DB connection found!", vim.log.levels.ERROR)
              return
            end

            local out_file = vim.fn.input("Export CSV to: ", vim.fn.expand("~/Downloads/result.csv"))
            if out_file == "" then
              return
            end

            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            local tmp_query = vim.fn.tempname() .. ".sql"
            vim.fn.writefile(lines, tmp_query)

            local parsed = vim.fn["db#url#parse"](db)
            local user = vim.fn.shellescape(parsed.user or "")
            local pass = vim.fn.shellescape(parsed.password or "")
            local dbname = vim.fn.shellescape((parsed.path or ""):gsub("^/", ""))
            local tmp_q = vim.fn.shellescape(tmp_query)
            local out_f = vim.fn.shellescape(out_file)
            local cmd = ""

            if parsed.scheme == "sqlserver" then
              local host_port = parsed.host
              if parsed.port and parsed.port ~= "" then
                host_port = host_port .. "," .. parsed.port
              end
              host_port = vim.fn.shellescape(host_port)
              cmd = string.format(
                "sqlcmd -S %s -d %s -U %s -P %s -C -s ',' -W -i %s > %s",
                host_port,
                dbname,
                user,
                pass,
                tmp_q,
                out_f
              )
            elseif parsed.scheme == "mysql" then
              local host = vim.fn.shellescape(parsed.host or "localhost")
              cmd = string.format(
                "mysql -h %s -u %s -p%s --ssl-verify-server-cert=false -D %s --batch < %s > %s",
                host,
                user,
                pass,
                dbname,
                tmp_q,
                out_f
              )
            else
              vim.notify("Export not configured for DB type: " .. parsed.scheme, vim.log.levels.ERROR)
              vim.fn.delete(tmp_query)
              return
            end

            vim.notify("\nExporting...", vim.log.levels.INFO)
            vim.fn.system(cmd)

            if vim.v.shell_error == 0 then
              vim.notify("Success! Exported to: " .. out_file, vim.log.levels.INFO)
            else
              vim.notify("Export failed! Check your connection or query.", vim.log.levels.ERROR)
            end
            vim.fn.delete(tmp_query)
          end, { buffer = args.buf, desc = "Export Query to CSV" })
        end,
      })
    end,
  },
}
