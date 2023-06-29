return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "rmagatti/auto-session",
    config = true,
    lazy = false,
    opts = {
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_use_git_branch = true,
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },

      post_restore_cmds = {
        "Neotree",
      },

      cwd_change_handling = {
        restore_upcoming_session = false,
      },
    },
    keys = {
      {
        "<leader>fs",
        function()
          require("auto-session.session-lens").search_session()
        end,
        desc = "Search sessions",
      },
    },
  },
}
