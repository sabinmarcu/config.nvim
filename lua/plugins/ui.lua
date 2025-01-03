return {
  {
    "folke/twilight.nvim",
    lazy = false,
    opts = {
      treesitter = true,
    },
    keys = {
      { "<leader>ut", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
  },
  {
    "folke/zen-mode.nvim",
    config = true,
    opts = {
      plugins = {
        options = { enabled = true },
        twilight = { enabled = true },
        wezterm = { enabled = true, font = "+4" },
        tmux = { enabled = true },
      },
      on_open = function()
        vim.cmd("TWEnable")
      end,
      on_close = function()
        vim.cmd("TWDisable")
      end,
    },
    lazy = false,
    keys = {
      { "<leader>uz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      zen = {
        on_open = function()
          vim.cmd("TWEnable")
        end,
        on_close = function()
          vim.cmd("TWDisable")
        end,
      },
    },
    keys = {
      {
        "<leader>uZ",
        function()
          require("snacks").zen()
        end,
        desc = "Toggle Zen Mode (new)",
      },
    },
  },
  {
    "joshuadanpeterson/typewriter.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    opts = {
      enable_with_zen_mode = true,
      enable_with_true_zen = false,
    },
    config = true,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "dstein64/nvim-scrollview",
    lazy = false,
    config = function()
      require("scrollview").setup({
        excluded_filetypes = {
          "neo-tree",
        },
      })
    end,
  },
  {
    "rasulomaroff/reactive.nvim",
    config = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      enable_named_colors = true,
      render = "virtual",
    },
    config = true,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mode = "chunk"

      local config = {
        chunk = {
          priority = 15,
          style = {
            { fg = "#806d9c" },
            { fg = "#c21f30" },
          },
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          textobject = "",
          max_file_size = 1024 * 1024,
          error_sign = true,
          -- animation related
          duration = 0,
          delay = 0,
        },
        line_num = {
          style = "#806d9c",
          priority = 10,
          use_treesitter = false,
        },
      }

      require("hlchunk").setup(config)

      local indentMod = require("hlchunk.mods." .. mode)
      local indent = indentMod(config[mode])

      local isEnabled = true
      local toggle = function(state)
        if state then
          isEnabled = true
          indent:enable()
          require("ibl").setup_buffer(0, { enabled = true })
        else
          isEnabled = false
          indent:disable()
          require("ibl").setup_buffer(0, { enabled = false })
        end
      end

      toggle(true)

      ---@diagnostic disable-next-line: undefined-global
      Snacks.toggle({
        name = "Indention Guides",
        get = function()
          return isEnabled
        end,
        set = toggle,
      }):map("<leader>ug")
    end,
  },
}
