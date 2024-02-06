return {
  "tim-harding/neophyte",
  tag = "0.2.2",
  event = "VeryLazy",
  opts = {
    -- Same as neophyte.setup({ ... })
    fonts = {
      "MonoLisa Variable",
      "Symbols Nerd Font",
    },
  },
  keys = {
    {
      "<C-+>",
      function()
        local neophyte = require("neophyte")
        neophyte.set_font_width(neophyte.get_font_width() + 1)
      end,
      desc = "Increase font width",
    },
    {
      "<C-->",
      function()
        local neophyte = require("neophyte")
        neophyte.set_font_width(neophyte.get_font_width() - 1)
      end,
      desc = "Decrease font width",
    },
  },
}
