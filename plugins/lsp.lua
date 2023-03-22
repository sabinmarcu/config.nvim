return {
  "jose-elias-alvarez/typescript.nvim",   -- add lsp plugin
  "sigmasd/deno-nvim",                    -- add lsp plugin
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "denols", "tsserver", "lua_ls", "eslint" }, -- automatically install lsp
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "typescript", "javascript" }
    }
  },
}
