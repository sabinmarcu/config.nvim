return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>/", false },
    },
  },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
      },
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
}
