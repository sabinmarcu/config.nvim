local extensions = { "ts", "tsx", "js", "jsx", "mjs", "cjs", "mts", "cts", "mdx" }
local midExtensions = { "spec", "test", "css", "type", "type.spec", "stories" }

local utils = require("utils")
local strings = require("strings")

local baseMappings = {
  ["lazyvim"] = {
    pattern = "^lazyvim%.json$",
    files = {
      "lazy-lock.json",
    },
  },
  ["package"] = {
    pattern = "^package%.json$",
    files = {
      "package-lock.json",
      "node_modules",
      "yarn*",
      ".yarn*",
      ".nvmrc*",
      "moon.yml",
      ".moon",
      ".vscode",
      ".git",
      ".gitignore",
      ".github",
      ".husky",
      ".editorconfig",
      ".commitlintrc.yml",
      "readme.*",
      "readme",
    },
  },
  ["tscmono"] = {
    pattern = "^%.tscmonorc%.(.*)$",
    files = {
      "tsconfig.json",
      "tsconfig.*.json",
    },
  },
  ["eslint"] = {
    pattern = "^%.eslintrc%.(.*)$",
    files = {
      ".eslint*",
    },
  },
  ["tsconfig"] = {
    pattern = "^tsconfig%.json$",
    files = {
      "tsconfig.*.json",
    },
  },
  ["dotenv"] = {
    pattern = "^%.env$",
    files = {
      ".env",
    },
  },
  ["jest_config"] = {
    pattern = "^jest%.config%.(.*)$",
    files = utils.concat({ "wallaby.js" }, strings.addExtensions("jest.*", extensions)),
  },
}

local function getCodeMappings()
  local mappings = {}
  for _, extension in ipairs(extensions) do
    mappings[extension] = {
      pattern = "^(.*)%." .. extension .. "$",
      files = strings.addExtensionsToList(strings.addExtensions("%1", midExtensions), extensions),
    }
  end
  return mappings
end

local nesting_rules = utils.merge(baseMappings, getCodeMappings())

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      nesting_rules = nesting_rules,
    },
  },
}
