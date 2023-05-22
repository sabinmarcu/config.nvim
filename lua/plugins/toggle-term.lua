return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
      { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<Ctrl+`>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    },
  },
}
