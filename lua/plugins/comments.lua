return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
    },
  },
  -- {
  --   "echasnovski/mini.comment",
  --   event = "VeryLazy",
  --   opts = {
  --     mappings = {
  --       comment = "gc",
  --       comment_line = "<Leader>/",
  --       textobject = "gc",
  --     },
  --   },
  -- },
  {
    "numToStr/Comment.nvim",
    keys = {
      -- { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      -- { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
      {
        "<leader>/",
        mode = { "n", "v" },
        "<cmd>lua require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)<CR>",
        desc = "Comment selection or line",
      },
    },
    -- opts = function()
    --   local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    --   return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    -- end,
  },
}
