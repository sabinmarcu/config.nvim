local M = {}

local utils = require("utils")
local json = require("json")

function M.addExtension(lhs, rhs)
  return lhs .. "." .. rhs
end

function M.addExtensionToList(lhs, rhs)
  local list = {}
  for _, item in ipairs(lhs) do
    list[#list + 1] = M.addExtension(item, rhs)
  end
  return list
end

function M.addExtensions(lhs, rhs)
  local list = {}
  for _, extension in ipairs(rhs) do
    list[#list + 1] = M.addExtension(lhs, extension)
  end
  return list
end

function M.addExtensionsToList(lhs, rhs)
  local list = {}
  for _, item in ipairs(lhs) do
    list = utils.concat(list, M.addExtensions(item, rhs))
  end
  return list
end

return M
