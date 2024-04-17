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
        "<leader>fo",
        function()
          require("oil").toggle_float()
        end,
        desc = "Open in Oil",
      },
      {
        "<leader>fO",
        function()
          require("oil").open()
        end,
        desc = "Open in Oil",
      },
    },
  },
}
