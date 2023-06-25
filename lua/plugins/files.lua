local extensions = { "ts", "tsx", "js", "jsx" }
local targets = {
  default = "source",
  css = "vanilla css",
  stories = "stories",
  spec = "specs",
  ["type.spec"] = "type specs",
}

local mappings = {}
local function getMid(target)
  if target == "default" then
    return ""
  end
  return "." .. target
end

local function processTarget(patternTarget)
  for _, extension in pairs(extensions) do
    local mapping = {}
    local mappingTargets = {}
    for target, targetDescription in pairs(targets) do
      if target ~= patternTarget then
        for _, targetExtension in pairs(extensions) do
          local newTarget = {
            target = "%1" .. getMid(target) .. "." .. targetExtension,
            context = targetDescription,
          }
          mappingTargets[#mappingTargets + 1] = newTarget
        end
      end
    end
    mapping["pattern"] = "(.*)" .. getMid(patternTarget) .. "." .. extension .. "$"
    mapping["target"] = mappingTargets
    mappings[#mappings + 1] = mapping
  end
end

for patternTarget, patternTargetDescription in pairs(targets) do
  if patternTarget ~= "default" then
    processTarget(patternTarget)
  end
end
processTarget("default")

return {
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = mappings,
        showMissingFiles = false,
      })
    end,

    keys = {
      { "<leader>of", "<cmd>Other<cr>", desc = "Open 'other' file" },
      { "<leader>ov", "<cmd>OtherVSplit<cr>", desc = "Open 'other' vertical split file" },
      { "<leader>os", "<cmd>OtherSplit<cr>", desc = "Open 'other' split file" },
    },
  },
  {
    "stevearc/oil.nvim",
    config = true,
    keys = {
      {
        "<leader>fo",
        function()
          require("oil").open()
        end,
        desc = "Open in Oil",
      },
    },
  },
}
