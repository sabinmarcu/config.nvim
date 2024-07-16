return {
  -- "sigmasd/deno-nvim", -- add lsp plugin
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        tsserver = {
          enabled = false,
        },
        vtsls = {
          settings = {
            typescript = {
              format = {
                enable = false,
              },
            },
            javascript = {
              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
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
