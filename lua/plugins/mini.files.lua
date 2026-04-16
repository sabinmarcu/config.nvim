return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fm", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>fM", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  {
    "nvim-mini/mini.files",
    opts = {
      mappings = {
        go_in = "L",
        go_in_plus = "l",
      },
    },
    config = function(_, opts)
      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local cur_target = MiniFiles.get_explorer_state().target_window
          local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. " split")
            return vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target)

          -- This intentionally doesn't act on file under cursor in favor of
          -- explicit "go in" action (`l` / `L`). To immediately open file,
          -- add appropriate `MiniFiles.go_in()` call instead of this comment.
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = "Split " .. direction

        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, "s", "belowright horizontal")
          map_split(buf_id, "v", "belowright vertical")
        end,
      })

      return require("mini.files").setup(opts)
    end,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },
}
