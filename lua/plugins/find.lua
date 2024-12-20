return {
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        hilight_on_key = true,
        -- dim = true,
      })
    end,
  },
  {

    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>fw", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    },
    opts = {
      grep = {
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
      },
    },
  },
}
