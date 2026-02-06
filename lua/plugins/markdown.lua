local LazyVim = require("lazyvim.util")

local function get_typescript_server_path(root_dir)
  local project_root = vim.fs.dirname(vim.fs.find("node_modules", { path = root_dir, upward = true })[1])
  return project_root and (project_root .. "/node_modules/typescript/lib") or ""
end

return {
  {
    "davidmh/mdx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "mdx_analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      table.insert(opts.servers.vtsls.filetypes, "mdx")
      table.insert(opts.servers.vtsls.filetypes, "markdown.mdx")

      LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "@mdx-js/typescript-plugin",
          enableForWorkspaceTypeScriptVersions = true,
          languages = {
            "mdx",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      mdx_analyzer = {
        settings = {
          checkMdx = true,
        },
        init_options = {
          typescript = {
            enabled = true,
          },
        },
        on_new_config = function(new_config, new_root_dir)
          if vim.tbl_get(new_config.init_options, "typescript") then
            new_config.init_options.typescript.enabled = true
            if not new_config.init_options.typescript.tsdk then
              new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
            end
          end
        end,
      },
    },
  },
}
