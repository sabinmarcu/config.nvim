return {
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          pattern = "*.(ts|js|tsx|jsx)",
          target = "*.spec.(ts|js|tsx|jsx)",
          transformer = "lowercase",
        },
        transformers = {
          -- defining a custom transformer
          lowercase = function(inputString)
            return inputString:lower()
          end,
        },

        showMissingFiles = true,
      })
    end,

    keys = {
      { "<leader>of", "<cmd>Other<cr>", desc = "Open 'other' file" },
      { "<leader>ov", "<cmd>OtherVSplit<cr>", desc = "Open 'other' vertical split file" },
      { "<leader>os", "<cmd>OtherSplit<cr>", desc = "Open 'other' split file" },
    },
  },
}
