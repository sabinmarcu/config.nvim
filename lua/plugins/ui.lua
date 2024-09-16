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
        wezterm = { enabled = false },
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
  -- {
  --   "pocco81/true-zen.nvim",
  --   commit = "98740c76254c65576ec294551028b65081053588",
  --   lazy = false,
  --   opts = {
  --     integrations = {
  --       twilight = true,
  --       tmux = true,
  --     },
  --     modes = {
  --       minimalist = {
  --         ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
  --       },
  --       ataraxis = {
  --         callbacks = {
  --           open_pre = function()
  --             vim.cmd("TWEnable")
  --           end,
  --           close_pos = function()
  --             vim.cmd("TWDisable")
  --           end,
  --         },
  --       },
  --     },
  --   },
  --   keys = {
  --     { "<leader>zn", mode = { "n" }, "<cmd>TZNarrow<cr>", desc = "Toggle Zen Narrow" },
  --     { "<leader>zn", mode = { "v" }, "<cmd>'<,'>TZNarrow<cr>", desc = "Toggle Zen Narrow" },
  --     { "<leader>zf", "<cmd>TZFocus<cr>", desc = "Toggle Zen Focus" },
  --     { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "Toggle Zen Minimalist" },
  --     { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "Toggle Zen Mode" },
  --   },
  -- },
  {
    "joshuadanpeterson/typewriter",
    opts = {
      enable_with_zen_mode = true,
      enable_with_true_zen = true,
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
    config = true,
    opts = function()
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
          print("Enabling")
          isEnabled = true
          indent:enable()
          require("ibl").setup_buffer(0, { enabled = false })
        else
          print("Disabling")
          isEnabled = false
          indent:disable()
          require("ibl").setup_buffer(0, { enabled = true })
        end
      end

      toggle(true)

      ---@diagnostic disable-next-line: undefined-global
      LazyVim.toggle.map("<leader>ug", {
        name = "Indention Guides",
        get = function()
          return isEnabled
        end,
        set = toggle,
      })
    end,
  },
}
