local originalVirtualText

local function enableLspLines()
  local currentVirtualText = vim.diagnostic.config().virtual_text
  if currentVirtualText and not originalVirtualText then
    originalVirtualText = currentVirtualText
  end

  vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
  return true
end

local function disableLspLines()
  local nextVirtualText = originalVirtualText or true
  vim.diagnostic.config({ virtual_lines = false, virtual_text = nextVirtualText })
  return false
end

local function toggleLspLines()
  local currentVirtualLines = vim.diagnostic.config().virtual_lines
  if currentVirtualLines then
    disableLspLines()
  else
    enableLspLines()
  end
end

return {
  -- "sigmasd/deno-nvim", -- add lsp plugin
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
        tsserver = {
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
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
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- "denols",
        "tsserver",
        "lua_ls",
        "eslint",
      }, -- automatically install lsp
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "regex",
      },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      enableLspLines()
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>uv",
        toggleLspLines,
        desc = "Toggle LSP Lines",
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
  },
}
