return {
  {
    "uga-rosa/translate.nvim",
    config = true,
    opts = {
      default = {
        output = "replace",
      },
    },
    keys = {
      { "<leader>Te", "<cmd>Translate EN<cr><esc>", mode = { "n", "v" }, desc = "Translate to English" },
      { "<leader>Ts", "<cmd>Translate SV<cr><esc>", mode = { "n", "v" }, desc = "Translate to Swedish" },
    },
  },
}
