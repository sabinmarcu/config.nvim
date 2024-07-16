local originalVirtualText

local function enableLspLines()
  local currentVirtualText = vim.diagnostic.config().virtual_text
  if currentVirtualText and not originalVirtualText then
    originalVirtualText = currentVirtualText
  end

  vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
  return true
end

local function disableLspLines()
  local nextVirtualText = originalVirtualText or true
  vim.diagnostic.config({ virtual_lines = false, virtual_text = nextVirtualText })
  return false
end

local function toggleLspLines()
  local currentVirtualLines = vim.diagnostic.config().virtual_lines
  if currentVirtualLines then
    disableLspLines()
  else
    enableLspLines()
  end
end

return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      enableLspLines()
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>uv",
        toggleLspLines,
        desc = "Toggle LSP Lines",
      },
    },
  },
}
