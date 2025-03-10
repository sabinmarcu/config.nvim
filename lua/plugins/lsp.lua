return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        eslint = {
          experimental = {
            useFlatConfig = true,
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>L", desc = "+lsp" },
      { "<leader>Lr", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
      { "<leader>Li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "eslint",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "regex",
      },
    },
  },
}
