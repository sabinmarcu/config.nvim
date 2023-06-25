return {
  {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup({
        overlay_opacity = 40,
        opacity_step = 10,
        keys = {
          brightness_up = "<C-Up>",
          brightness_down = "<C-Down>",
          toggle = "<leader>uS",
        },
      })
    end,
    lazy = false,
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
        treesitter = true,
        expand = {
          "function",
          "method",
          "table",
          "if_statement",
        },
      })
    end,
    lazy = false,
    keys = {
      { "<leader>ut", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end,
    lazy = false,
    keys = {
      { "<leader>uz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
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
}
