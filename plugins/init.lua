return {
  { 'folke/tokyonight.nvim' },
  { "ellisonleao/gruvbox.nvim" },
  { "JoosepAlviste/palenightfall.nvim" },
  {
    "RRethy/vim-illuminate",
  },
  { "github/copilot.vim" },
  {
    "kylechui/nvim-surround",
    tag = "*",
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
  },
  {
    'f-person/git-blame.nvim'
  },
  {
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  -- { 'wakatime/vim-wakatime' },
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
