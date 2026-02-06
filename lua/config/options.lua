-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_eslint_auto_format = true
vim.o.autoread = true
vim.g.ai_cmp = false

vim.g.mapleader = " "
vim.g.maplocalleader = "."

if vim.g.neovide then
  require("config.neovide")
end
