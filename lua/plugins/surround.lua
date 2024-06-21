return {
  {
    "echasnovski/mini.surround",
    enabled = false,
    opts = {
      mappings = {
        add = "S",
        delete = "ds",
        find = "fs",
        find_left = "fsl",
        highlight = "hs",
        replace = "cs",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    enabled = true,
    version = "*",
    event = "VeryLazy",
    config = true,
    vscode = true,
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    },
  },
}
