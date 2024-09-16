return {
  {
    "gbprod/substitute.nvim",
    keys = function()
      local substitute = require("substitute")
      return {
        {
          "s",
          mode = { "n" },
          substitute.operator,
        },
        {
          "ss",
          mode = { "n" },
          substitute.line,
        },
        {
          "S",
          mode = { "n" },
          substitute.eol,
        },
        {
          "s",
          mode = { "x" },
          substitute.visual,
        },
      }
    end,
  },
}
