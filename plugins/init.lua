return {
  { 'folke/tokyonight.nvim' },
  { "ellisonleao/gruvbox.nvim" },
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
          require('neotest-jest'),
        }
      })
    end
  },
  {
    'f-person/git-blame.nvim'
  },
  {
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
}
