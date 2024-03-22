return {
  "sigmasd/deno-nvim", -- add lsp plugin
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        -- jsonls = {
        --   settings = {
        --     json = {
        --       schemas = require("schemastore").json.schemas(),
        --       validate = { enable = true },
        --     },
        --   },
        -- },
        -- yamlls = {
        --   settings = {
        --     yaml = {
        --       schemaStore = {
        --         -- You must disable built-in schemaStore support if you want to use
        --         -- this plugin and its advanced options like `ignore`.
        --         enable = false,
        --         -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        --         url = "",
        --       },
        --       schemas = require("schemastore").yaml.schemas(),
        --     },
        --   },
        -- },
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
    },
    -- dependencies = {
    --   "b0o/schemastore.nvim",
    -- },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "denols", "tsserver", "lua_ls", "eslint" }, -- automatically install lsp
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "typescript", "javascript", "markdown", "regex" },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = true,
    keys = {
      {
        "<leader>u",
        function()
          require("lsp_lines").toggle()
        end,
        desc = "Toggle lsp_lines",
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
  },
}
