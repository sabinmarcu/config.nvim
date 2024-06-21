return {
  {
    "folke/twilight.nvim",
    lazy = false,
    opts = {
      treesitter = true,
    },
    keys = {
      { "<leader>ut", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
  },
  {
    "folke/zen-mode.nvim",
    config = true,
    opts = {
      plugins = {
        options = { enabled = true },
        twilight = { enabled = true },
        wezterm = { enabled = true },
      },
      on_open = function()
        vim.cmd("TWEnable")
      end,
      on_close = function()
        vim.cmd("TWDisable")
      end,
    },
    lazy = false,
    keys = {
      { "<leader>uz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
  },
  -- {
  --   "pocco81/true-zen.nvim",
  --   commit = "98740c76254c65576ec294551028b65081053588",
  --   lazy = false,
  --   opts = {
  --     integrations = {
  --       twilight = true,
  --       tmux = true,
  --     },
  --     modes = {
  --       minimalist = {
  --         ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
  --       },
  --       ataraxis = {
  --         callbacks = {
  --           open_pre = function()
  --             vim.cmd("TWEnable")
  --           end,
  --           close_pos = function()
  --             vim.cmd("TWDisable")
  --           end,
  --         },
  --       },
  --     },
  --   },
  --   keys = {
  --     { "<leader>zn", mode = { "n" }, "<cmd>TZNarrow<cr>", desc = "Toggle Zen Narrow" },
  --     { "<leader>zn", mode = { "v" }, "<cmd>'<,'>TZNarrow<cr>", desc = "Toggle Zen Narrow" },
  --     { "<leader>zf", "<cmd>TZFocus<cr>", desc = "Toggle Zen Focus" },
  --     { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "Toggle Zen Minimalist" },
  --     { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "Toggle Zen Mode" },
  --   },
  -- },
  {
    "joshuadanpeterson/typewriter",
    opts = {
      enable_with_zen_mode = true,
      enable_with_true_zen = true,
    },
    config = true,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "dstein64/nvim-scrollview",
    lazy = false,
    config = function()
      require("scrollview").setup({
        excluded_filetypes = {
          "neo-tree",
        },
      })
    end,
  },
  {
    "rasulomaroff/reactive.nvim",
    config = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      enable_named_colors = true,
      enable_tailwind = true,
      render = "virtual",
    },
    config = true,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
  },
}
