return {
  -- "sigmasd/deno-nvim", -- add lsp plugin
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- "denols",
        "vtsls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "javascript",
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
  },
}
