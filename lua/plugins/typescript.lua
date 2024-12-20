return {
  -- "sigmasd/deno-nvim", -- add lsp plugin
  {
    "williamboman/mason-lspconfig.nvim",
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
