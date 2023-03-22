return {
  { "github/copilot.vim" },
  {
    'gpanders/editorconfig.nvim'
  },
  {
    "kylechui/nvim-surround",
    event = "User AstroFile",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "ziontee113/icon-picker.nvim",
    dependencies = {
      "stevearc/dressing.nvim"
    },
    event = "User AstroFile",
    config = function()
      require("icon-picker").setup({
        -- disable_legacy_commands = true
      })
    end
  },
}
