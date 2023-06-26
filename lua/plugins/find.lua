local Util = require("lazyvim.util")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
      { "<leader>fw", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
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
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
}
