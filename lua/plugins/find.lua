local Util = require("lazyvim.util")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
      {
        "<leader>fw",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep (root dir)",
      },
    },
  },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        hilight_on_key = true,
        -- dim = true,
      })
    end,
  },
}
