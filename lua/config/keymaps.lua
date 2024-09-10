-- stylua: ignore
local Util = require("lazyvim.util")
local mapping = require("mapping")

mapping.unmap("n", "<leader>ft", { desc = "Terminal (root dir)" })
mapping.unmap("n", "<leader>fT", { desc = "Terminal (cwd)" })
mapping.unmap("t", "<esc><esc>", { desc = "Enter Normal Mode" })

mapping.map("n", "<leader>yp", function()
  vim.cmd(":let @+ = '" .. vim.fn.expand("%") .. "'")
end, { desc = "Copy File Path" })

mapping.map("n", "<leader>.", "<cmd>Lazy<cr>", { desc = "Lazy" })
mapping.map("n", "<leader>l", "<C-w>l", { desc = "Right Pane" })
mapping.map("n", "<leader>h", "<C-w>h", { desc = "Left Pane" })
mapping.map("n", "<leader>j", "<C-w>j", { desc = "Down Pane" })
mapping.map("n", "<leader>k", "<C-w>k", { desc = "Up Pane" })

mapping.map("n", "rr", "<cmd>e %<cr>", { desc = "Refresh Buffer" })

if vim.g.neovide then
  require("config.guikeymaps")
end

-- mapping.map("n", "<leader>gm", function()
--   Util.terminal({ "which glmr" }, { esc_esc = false, ctrl_hjkl = false })
-- end, { desc = "Gitlab MR" })
