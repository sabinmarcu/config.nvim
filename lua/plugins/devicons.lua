return {
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = true,
  },
  {
    "echasnovski/mini.icons",
    opts = {
      file = {
        ["eslint.config.mjs"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["eslint.config.cjs"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["tsconfig.eslint.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["jest.config.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        ["jest.config.options.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        ["jest.config.project.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        [".gitlab.workspaces.yml"] = { glyph = "󰮠 ", hl = "MiniIconsOrange" },
      },
    },
  },
}
