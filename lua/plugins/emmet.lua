return {
  {
    "olrtg/nvim-emmet",
    keys = {
      {
        "<leader>xe",
        function()
          require("nvim-emmet").wrap_with_abbreviation()
        end,
        desc = "Emmet",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "emmet-language-server",
      },
    },
  },
}
