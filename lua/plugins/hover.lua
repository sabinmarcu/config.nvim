return {

  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gK", false }
    end,
  },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = nil,
        },
        preview_window = false,
        title = true,
      })
    end,
    keys = {
      {
        "K",
        function()
          require("hover").hover()
        end,
        desc = "Hover Info",
      },
      {
        "gK",
        function()
          require("hover").hover_select()
        end,
        desc = "Hover Info (select)",
      },
    },
  },
}
