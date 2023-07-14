return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>j"] = { name = "+test" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      {
        "sabinmarcu/neotest-jest",
        -- dir = "~/Projects/neotest-jest",
      },
    },
    config = function()
      require("neotest").setup({
        discovery = {
          enabled = false,
        },
        adapters = {
          require("neotest-jest")({
            jestCommand = "jest --watch ",
            jestConfigFile = "jest.config.mjs",
            jest_test_discovery = true,
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
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
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     commands = {
  --       run_jest = function(state)
  --         local tree = state.tree
  --         local success, node = pcall(tree.get_node, tree)
  --         if node.type == "message" then
  --           return
  --         end
  --         if not (success and node) then
  --           return
  --         end
  --         local pathToOpen = node.path
  --         local Terminal = require("toggleterm.terminal").Terminal
  --         local newTerm = Terminal:new({
  --           cmd = "jest --watch " .. pathToOpen,
  --           direction = "vertical",
  --           width = 100,
  --           on_open = function(term)
  --             vim.cmd("startinsert!")
  --             vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  --           end,
  --           on_close = function()
  --             vim.cmd("startinsert!")
  --           end,
  --         })
  --         newTerm:open()
  --       end,
  --     },
  --     window = {
  --       mappings = {
  --         ["j"] = "run_jest",
  --       },
  --     },
  --   },
  -- },
}
