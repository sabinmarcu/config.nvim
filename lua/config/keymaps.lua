-- stylua: ignore
local Util = require("lazyvim.util")

-- stylua: ignore
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function unmap(mode, lhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.del(mode, lhs, opts)
  end
end

unmap("n", "<leader>ft", { desc = "Terminal (root dir)" })
unmap("n", "<leader>fT", { desc = "Terminal (cwd)" })
unmap("t", "<esc><esc>", { desc = "Enter Normal Mode" })
