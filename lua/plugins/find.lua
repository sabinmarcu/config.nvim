local Util = require("lazyvim.util")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
      { "<leader>fw", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    },
  },
}
