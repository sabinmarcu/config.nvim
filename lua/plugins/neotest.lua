package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        -- "nvim-neotest/neotest-jest",
        "marilari88/neotest-vitest",
        -- "sabinmarcu/neotest-jest",
        dir = "~/Projects/Personal/neotest-jest/",
      },
    },
    opts = {
      discovery = {
        enabled = false,
      },
      adapters = {
        -- ["neotest-vitest"] = {
        --   viteCommand = "yarn vite --test",
        --   filter_dir = function(name)
        --     return name ~= "node_modules"
        --   end,
        -- },
        ["neotest-jest"] = {
          jestCommand = "yarn jest --watch",
          -- jestConfigFile = "jest.config.mjs",
          -- jestConfigFile = function(file)
          --   local glob = require("glob")
          --   local pattern = { "jest.config.{mjs,cjs,mts,cts,ts,js}" }
          --   local parser = glob.glob(pattern)
          --   local result = parser:scan()
          --   print("RESULT", result)
          --   print(result)
          -- end,
          jest_test_discovery = true,
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
      output = {
        enable = true,
        open_on_run = true,
      },
    },
  },
}
