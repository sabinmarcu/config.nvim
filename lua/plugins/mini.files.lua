return {
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   keys = {
  --     { "<leader>fm", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
  --     { "<leader>fM", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  --     { "<leader>e", false },
  --     { "<leader>E", false },
  --   },
  -- },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  {
    "nvim-mini/mini.files",
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },
}
