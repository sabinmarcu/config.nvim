local json = require("json")
local utils = require("utils")

local root_has_file = function(files)
  return function(localUtils)
    return localUtils.root_has_file(files)
  end
end

local eslint_root_files =
  { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs" }
local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
local stylua_root_files = { "stylua.toml", ".stylua.toml" }
local elm_root_files = { "elm.json" }

local ownOpts = {
  eslint_formatting = {
    condition = function(localUtils)
      local has_eslint = root_has_file(eslint_root_files)(localUtils)
      local has_prettier = root_has_file(prettier_root_files)(localUtils)
      return has_eslint and not has_prettier
    end,
  },
  eslint_diagnostics = {
    condition = root_has_file(eslint_root_files),
  },
  prettier_formatting = {
    condition = root_has_file(prettier_root_files),
  },
  stylua_formatting = {
    condition = root_has_file(stylua_root_files),
  },
  elm_format_formatting = {
    condition = root_has_file(elm_root_files),
  },
}

local supported = {
  "css",
  "graphql",
  "handlebars",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "jsonc",
  "less",
  "markdown",
  "markdown.mdx",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}

return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local null_ls = require("null-ls")

      local function on_attach(client, _)
        if client.server_capabilities.document_formatting then
          vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
          vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
        end
      end

      local localSources = {
        null_ls.builtins.formatting.prettier.with(ownOpts.prettier_formatting),
        null_ls.builtins.formatting.stylua.with(ownOpts.stylua_formatting),
      }

      local builtinsToReplace = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
      }

      opts.sources = opts.sources or {}

      -- Remove old sources
      for _, builtin in ipairs(builtinsToReplace) do
        local indexOfBuiltin = utils.indexOf(opts.sources, builtin)
        if indexOfBuiltin then
          table.remove(opts.sources, indexOfBuiltin)
        end
      end

      -- Add our own
      for _, localSource in ipairs(localSources) do
        table.insert(opts.sources, localSource)
      end

      opts.on_attach = on_attach
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      local typescriptFormatters =
        { "eslint_d", "eslint", "prettier_d", "prettier", stop_after_first = true, lsp_format = "never" }
      for _, ft in ipairs(supported) do
        opts.formatters[ft] = typescriptFormatters
      end
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},
      },
      setup = {
        eslint = function()
          Snacks.util.lsp.on({}, function(_, client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
