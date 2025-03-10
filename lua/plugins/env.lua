return {
  {
    "philosofonusus/ecolog.nvim",
    dependencies = {},
    keys = {
      { "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
      { "<leader>ep", "<cmd>EcologPeek<cr>", desc = "Ecolog peek variable" },
      { "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
      { "<leader>ee", "<cmd>EcologFzf<cr>", desc = "Select env variable" },
    },
    -- Lazy loading is done internally
    lazy = false,
    opts = {
      integrations = {
        blink_cmp = true,
        lsp = true,
        fzf = {
          shelter = {
            mask_on_copy = false, -- Whether to mask values when copying
          },
          mappings = {
            copy_value = "ctrl-y", -- Copy variable value to clipboard
            copy_name = "ctrl-n", -- Copy variable name to clipboard
            append_value = "ctrl-a", -- Append value at cursor position
            append_name = "enter", -- Append name at cursor position
          },
        },
      },
      -- Enables shelter mode for sensitive values
      shelter = {
        configuration = {
          -- Partial mode configuration:
          -- false: completely mask values (default)
          -- true: use default partial masking settings
          -- table: customize partial masking
          -- partial_mode = false,
          -- or with custom settings:
          partial_mode = {
            show_start = 3, -- Show first 3 characters
            show_end = 3, -- Show last 3 characters
            min_mask = 3, -- Minimum masked characters
          },
          mask_char = "*", -- Character used for masking
        },
        modules = {
          cmp = true, -- Enabled to mask values in completion
          peek = false, -- Enable to mask values in peek view
          files = true, -- Enabled to mask values in file buffers
          telescope = false, -- Enable to mask values in telescope integration
          telescope_previewer = false, -- Enable to mask values in telescope preview buffers
          fzf = false, -- Enable to mask values in fzf picker
          fzf_previewer = false, -- Enable to mask values in fzf preview buffers
          snacks_previewer = false, -- Enable to mask values in snacks previewer
          snacks = false, -- Enable to mask values in snacks picker
        },
      },
      -- true by default, enables built-in types (database_url, url, etc.)
      types = true,
      path = vim.fn.getcwd(), -- Path to search for .env files
      preferred_environment = "development", -- Optional: prioritize specific env files
      -- Controls how environment variables are extracted from code and how cmp works
      provider_patterns = true, -- true by default, when false will not check provider patterns
    },
  },
  {
    "saghen/blink.cmp",
    disabled = vim.g.neovide,
    opts = {
      sources = {
        default = { "ecolog", "lsp", "path", "snippets", "buffer" },
        providers = {
          ecolog = { name = "ecolog", module = "ecolog.integrations.cmp.blink_cmp" },
        },
      },
    },
  },
}
