return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment = "<leader>/",
        comment_line = "<leader>/",
        textobject = "gt",
      },
    },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Documentation",
      },
    },
  },
}
