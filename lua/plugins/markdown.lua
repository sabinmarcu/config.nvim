return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = {
          mdx = "markdown.mdx",
          ["markdown.mdx"] = "mdx",
        },
      })
      vim.treesitter.language.register("javascript", "markdown.mdx")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["mdx_analyzer"] = {},
      },
    },
  },
}
