-- stylua: ignore
local mapping = require("mapping")

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
    opts = function()
      ---@class ParserInfo[]
      local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

      parser_configs.lua_patterns = {
        install_info = {
          url = "https://github.com/OXY2DEV/tree-sitter-lua_patterns",
          files = { "src/parser.c" },
          branch = "main",
        },
      }

      return {
        ensure_installed = {
          "lua",
          "lua_patterns",
          "regex",
          "kdl",
        },
      }
    end,
  },
  {
    "OXY2DEV/patterns.nvim",
  },
}
