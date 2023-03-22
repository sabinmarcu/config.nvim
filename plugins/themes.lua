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
}
