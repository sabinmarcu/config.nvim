return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      config = function()
        require("telescope").load_extension("live_grep_args")
      end,
      keys = {
        { "<leader>/", false },
        {
          "<leader>fs",
          function()
            require("telescope").extensions.live_grep_args.live_grep_args()
          end,
          desc = "Grep Args (root dir)",
        },
      },
    },
  },
}
