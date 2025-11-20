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
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "eslint",
      },
      automatic_installation = true,
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
