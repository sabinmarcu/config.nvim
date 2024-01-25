return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["l"] = { "toggle_node", nowait = false },
        ["h"] = { "close_node" },
      },
    },
  },
}
