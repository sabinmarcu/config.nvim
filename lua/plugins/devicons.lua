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
    "nvim-mini/mini.icons",
    opts = {
      file = {
        ["eslint.config.mjs"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["eslint.config.cjs"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["tsconfig.eslint.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["jest.config.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        ["jest.config.options.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        ["jest.config.project.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        ["wallaby.mjs"] = { glyph = "", hl = "MiniIconsOrange" },
        ["wallaby.js"] = { glyph = "", hl = "MiniIconsOrange" },
        [".gitlab.workspaces.yml"] = { glyph = "󰮠", hl = "MiniIconsOrange" },
        [".tmuxinator.yml"] = { glyph = "", hl = "MiniIconsOrange" },
        ["yarn.config.cjs"] = { glyph = "", hl = "MiniIconsAzure" },
        [".markdownlint.yaml"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        ["mdx"] = { glyph = "󰍔", hl = "MiniIconsWhite" },
        ["markdown.mdx"] = { glyph = "󰍔", hl = "MiniIconsWhite" },
      },
    },
  },
}
