local util = require("lspconfig.util")

local function get_typescript_server_path(root_dir)
  local project_root = vim.fs.dirname(vim.fs.find("node_modules", { path = root_dir, upward = true })[1])
  return project_root and (project_root .. "/node_modules/typescript/lib") or ""
end
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "markdown.mdx" }
    end,
    ft = { "markdown", "markdown.mdx" },
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
    opts = function()
      return {
        servers = {
          ["mdx_analyzer"] = {
            filetypes = { "markdown.mdx" },
            root_dir = util.root_pattern(".yarnrc.yml", "node_modules/typescript", ".git", "package.json"),
            single_file_support = true,
            settings = {},
            init_options = {
              typescript = {},
            },
            on_new_config = function(new_config, new_root_dir)
              if vim.tbl_get(new_config.init_options, "typescript") and not new_config.init_options.typescript.tsdk then
                new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
              end
            end,
          },
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdown-toc" },
      },
    },
  },
}
