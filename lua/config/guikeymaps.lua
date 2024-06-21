local mapping = require("mapping")

mapping.map("n", "<D-c>", '"*y :let @+=@*<CR>', { silent = true })
mapping.map("n", "<D-v>", '"+p', { silent = true })
mapping.map("i", "<D-c>", '"*y :let @+=@*<CR>', { silent = true })
mapping.map("i", "<D-v>", '<esc>"+pa', { silent = true })
mapping.map("v", "<D-c>", '"*y :let @+=@*<CR>', { silent = true })
mapping.map("v", "<D-v>", '"+p', { silent = true })

mapping.map("n", "<D-z>", "<cmd>undo<cr>", { silent = true })
mapping.map("i", "<D-z>", "<esc><cmd>undo<cr>", { silent = true })
mapping.map("n", "<D-S-z>", "u", { silent = true })
mapping.map("i", "<D-S-z>", "u", { silent = true })

mapping.map("n", "<D-s>", "<cmd>w<cr>", { silent = true })
mapping.map("n", "<D-w>", "<cmd>bd<cr>", { silent = true })
