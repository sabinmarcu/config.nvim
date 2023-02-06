return {
  { 'folke/tokyonight.nvim' },
  -- { "ellisonleao/gruvbox.nvim" },
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_better_performance = 1
    end
  },
  { "JoosepAlviste/palenightfall.nvim" },
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
    end
  },
  { "github/copilot.vim" },
  {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  },
  {
    'gpanders/editorconfig.nvim'
  },
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = "jest --watch ",
          }),
          -- require('neotest-vim-test')
        },
        output = {
          enable = true,
          open_on_run = true,
        },
      })
    end
  },
  {
    'f-person/git-blame.nvim'
  },
  {
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ziontee113/icon-picker.nvim",
    requires = {
      "stevearc/dressing.nvim"
    },
    config = function()
      require("icon-picker").setup({
        -- disable_legacy_commands = true
      })
    end
  },
  {
    'sunjon/shade.nvim',
    config = function()
      require('shade').setup({
        overlay_opacity = 70,
        opacity_step = 2
      })
    end
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
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end
  },
  { 'wakatime/vim-wakatime' },
  -- {
  --   'anuvyklack/pretty-fold.nvim',
  --   config = function()
  --     require('pretty-fold').setup()
  --   end
  -- },
  -- {
  --   'kevinhwang91/nvim-ufo',
  --   requires = 'kevinhwang91/promise-async',
  --   config = function()
  --     require('ufo').setup({
  --       provider_selector = function()
  --         return { 'treesitter', 'indent' }
  --       end
  --     })
  --   end
  -- },
}
