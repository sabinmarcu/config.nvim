return {
  {
    'sunjon/shade.nvim',
    config = function()
      require('shade').setup({
        overlay_opacity = 40,
        opacity_step = 10,
        keys = {
          brightness_up   = '<C-Up>',
          brightness_down = '<C-Down>',
          toggle          = '<Leader>s',
        }
      })
    end,
    lazy = false
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
          "if_statement"
        }
      })
    end,
    lazy = false
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end,
    lazy = false
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex'
        }
      })
    end,
    event = "User AstroFile"
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    }
  }
}
