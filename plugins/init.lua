return {
  {
    'glacambre/firenvim',
    build = function() vim.fn['firenvim#install'](0) end,
    lazy = false
  },
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
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
