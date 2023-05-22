return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
  },
  event = "User AstroFile",
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "jest --watch ",
        }),
        -- require('neotest-vim-test')
      },
      output = {
        enable = true,
        open_on_run = true,
      },
    })
  end,
}
