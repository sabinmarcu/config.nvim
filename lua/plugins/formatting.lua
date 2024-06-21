local utils = require("utils")

local root_has_file = function(files)
  return function(localUtils)
    return localUtils.root_has_file(files)
  end
end

local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
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
---
---@alias ConformCtx {buf: number, filename: string, dirname: string}
local M = {}

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

--- Checks if a Prettier config file exists for the given context
---@param ctx ConformCtx
function M.has_config(ctx)
  vim.fn.system({ "prettier", "--find-config-path", ctx.filename })
  return vim.v.shell_error == 0
end

--- Checks if a parser can be inferred for the given context:
--- * If the filetype is in the supported list, return true
--- * Otherwise, check if a parser can be inferred
---@param ctx ConformCtx
function M.has_parser(ctx)
  local ft = vim.bo[ctx.buf].filetype --[[@as string]]
  -- default filetypes are always supported
  if vim.tbl_contains(supported, ft) then
    return true
  end
  -- otherwise, check if a parser can be inferred
  local ret = vim.fn.system({ "prettier", "--file-info", ctx.filename })
  ---@type boolean, string?
  local ok, parser = pcall(function()
    return vim.fn.json_decode(ret).inferredParser
  end)
  return ok and parser and parser ~= vim.NIL
end

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
        -- null_ls.builtins.diagnostics.eslint_d.with(ownOpts.eslint_diagnostics),
        -- null_ls.builtins.formatting.eslint_d.with(ownOpts.eslint_formatting),
        null_ls.builtins.formatting.prettier.with(ownOpts.prettier_formatting),
        null_ls.builtins.formatting.stylua.with(ownOpts.stylua_formatting),
        -- null_ls.builtins.code_actions.eslint_d.with(ownOpts.eslint_diagnostics),
      }

      local builtinsToReplace = {
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.code_actions.eslint_d,
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
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = { "prettier" }
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        condition = function(_, ctx)
          print(
            vim.g.lazyvim_prettier_needs_config,
            M.has_config(ctx),
            vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx)
          )
          return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
        end,
      }
    end,
  },
}
