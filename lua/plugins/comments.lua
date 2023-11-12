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
    enabled = false,
    -- config = true,
    -- opts = {
    -- ignore_blank_line = true,
    -- mappings = {
    -- comment = "<leader>/",
    -- comment_line = "<leader>/",
    -- textobject = "gt",
    -- },
    -- },
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      mappings = {
        basic = true,
      },
      toggler = {
        line = "<leader>/",
      },
      opleader = {
        line = "<leader>/",
      },
    },
    lazy = false,
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
