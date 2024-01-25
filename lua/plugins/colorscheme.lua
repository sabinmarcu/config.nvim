return {
  { "JoosepAlviste/palenightfall.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  { "nordtheme/vim" },
  { "chriskempson/vim-tomorrow-theme" },
  {
    "navarasu/onedark.nvim",
  },
}
