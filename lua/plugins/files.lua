return {
  {
    "stevearc/oil.nvim",
    config = true,
    keys = {
      {
        "<leader>fo",
        function()
          require("oil").toggle_float()
        end,
        desc = "Open in Oil",
      },
    },
  },
}
