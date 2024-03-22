return {
  {
    "f-person/git-blame.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "isak102/telescope-git-file-history.nvim",
        dependencies = { "tpope/vim-fugitive" },
        config = function()
          require("telescope").load_extension("git_file_history")
        end,
        keys = {
          {
            "<leader>gf",
            function()
              require("telescope").extensions.git_file_history.git_file_history()
            end,
            desc = "Git file history",
          },
        },
      },
    },
  },
}
