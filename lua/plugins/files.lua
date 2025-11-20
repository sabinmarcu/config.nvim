return {
  {
    "stevearc/oil.nvim",
    config = true,
    opts = {
      keymaps = {
        ["s"] = "actions.select_vsplit",
        ["S"] = "actions.select_split",
      },
    },
    keys = {
      {
        "<leader>fO",
        function()
          require("oil").toggle_float()
        end,
        desc = "Open in Oil",
      },
      -- {
      --   "<leader>fO",
      --   function()
      --     require("oil").open()
      --   end,
      --   desc = "Open in Oil (replace buffer)",
      -- },
    },
  },
  {
    "Eutrius/Otree.nvim",
    lazy = false,
    dependencies = {
      "stevearc/oil.nvim",
      { "nvim-mini/mini.icons", opts = {} },
    },
    config = true,
    opts = {
      oil = "float",
    },
    keys = {
      {
        "<leader>fo",
        "<cmd>OtreeFocus<cr>",
        desc = "Oil Tree",
      },
    },
  },
}
