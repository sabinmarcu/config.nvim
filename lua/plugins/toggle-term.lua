return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      commands = {
        open_terminal = function(state)
          local tree = state.tree
          local success, node = pcall(tree.get_node, tree)
          if node.type == "message" then
            return
          end
          if not (success and node) then
            return
          end
          local pathToOpen = node.path
          if node.type ~= "directory" then
            pathToOpen = string.match(pathToOpen, "^(.*)/")
          end
          local Terminal = require("toggleterm.terminal").Terminal
          local newTerm = Terminal:new({
            dir = pathToOpen,
            direction = "float",
            on_open = function(term)
              vim.cmd("startinsert!")
              vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
            on_close = function()
              vim.cmd("startinsert!")
            end,
          })
          newTerm:open()
        end,
      },
      window = {
        mappings = {
          ["t"] = "open_terminal",
        },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      winbar = {
        enabled = true,
      },
    },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
      { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<Ctrl+`>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    },
  },
}
