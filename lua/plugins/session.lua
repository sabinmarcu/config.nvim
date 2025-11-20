return {
  {
    "niba/continue.nvim",
    lazy = false,
    config = true,

    ---@module "continue"
    ---@type Continue.Config
    opts = {
      auto_save = true, -- enable / disable auto saving session on Neovim exit
      auto_restore = true, -- enable / disable auto restoring session on Neovim startup
      auto_save_min_buffer = 1, -- minimum number of buffers required to trigger auto-save
      auto_restore_on_branch_change = true, -- reload session when a Git branch change is detected

      use_git_branch = true, -- store unique sessions per Git branch
      use_git_host = true, -- identify projects by Git remote host instead of local system path
      git_remote = "origin", -- Git remote to use as the project base (requires use_git_host = true). Accepts string or fun(cwd: string): string

      react_on_cwd_change = false, -- reload session if the current working directory (CWD) changes

      log_level = vim.log.levels.WARN, -- set the logging level
      picker = "snacks", -- default picker for session management
      shada = {
        -- project specific data
        -- stores jumplists, marks, searches
        project = "'100,<50,s10,h,:0,/1000",
        -- global data
        -- stores commands history
        global = "!,'0,<0,s10,h,:1000,/0,f0",
      },
      mappings = {
        -- mappings for picker actions
        delete_session = { "i", "<C-X>" },
        save_as_session = { "i", "<C-S>" },
      },
      -- define extensions to save/restore additional data
      extensions = {},
    },
  },
  {
    "folke/persistence.nvim",
    disabled = true,
  },
}
