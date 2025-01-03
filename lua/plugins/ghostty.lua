return {
  "isak102/ghostty.nvim",
  opts = {
    file_pattern = "*/ghostty*[^.]*,*/ghostty",
  },
  config = function(_, opts)
    vim.filetype.add({
      pattern = {
        [".*/ghostty[^%.]*"] = "toml",
      },
    })
    require("ghostty").setup(opts)
  end,
}
