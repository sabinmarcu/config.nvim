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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["mdx_analyzer"] = {
          cmd = { "mdx-language-server", "--stdio" },
          filetypes = { "mdx", "markdown.mdx" },
          root_dir = util.root_pattern("package.json"),
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
    },
  },
}
