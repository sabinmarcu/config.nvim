return {
  {
    "willothy/strat-hero.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = true,
    lazy = true,
    cmd = "StratHero",
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
}
