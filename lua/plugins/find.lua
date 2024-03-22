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
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        hilight_on_key = true,
        -- dim = true,
      })
    end,
  },
}
