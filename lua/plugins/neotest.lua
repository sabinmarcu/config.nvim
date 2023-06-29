return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
  },
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
  keys = {
    {
      "<leader>ja",
      function()
        require("neotest").run.attach()
      end,
      desc = "Attach",
    },
    {
      "<leader>jf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run file",
    },
    {
      "<leader>jF",
      function()
        require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
      end,
      desc = "Debug file",
    },
    {
      "<leader>jl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run last",
    },
    {
      "<leader>jL",
      function()
        require("neotest").run.run_last({ strategy = "dap" })
      end,
      desc = "Debug last",
    },
    {
      "<leader>jn",
      function()
        require("neotest").run.run()
      end,
      desc = "Run nearest",
    },
    {
      "<leader>jN",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug nearest",
    },
    {
      "<leader>jo",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Output Window",
    },
    {
      "<leader>js",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
    {
      "<leader>jS",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Summary",
    },
  },
}
