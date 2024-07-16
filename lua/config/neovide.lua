vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.8

vim.g.neovide_window_blurred = true
vim.g.neovide_remember_window_size = true

vim.g.neovide_floating_blur_amount_x = 6.0
vim.g.neovide_floating_blur_amount_y = 6.0

local map = vim.keymap

map.set({ "n", "v" }, "<D-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
map.set({ "n", "v" }, "<D-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
map.set({ "n", "v" }, "<D-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
map.set({ "n", "v" }, "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
