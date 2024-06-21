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
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "emmet-language-server",
      }, -- automatically install lsp
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["emmet_language_server"] = {},
      },
    },
  },
}
