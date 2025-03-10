local mapping = require("mapping")

-- Copy + Paste
mapping.map("n", "<D-c>", '"*y :let @+=@*<CR>', { silent = true })
mapping.map("n", "<D-v>", '"+p', { silent = true })
mapping.map("i", "<D-c>", '"*y :let @+=@*<CR>', { silent = true })
mapping.map("i", "<D-v>", '<esc>"+pa', { silent = true })
mapping.map("v", "<D-c>", '"*y :let @+=@*<CR>', { silent = true })
mapping.map("v", "<D-v>", '"+p', { silent = true })

-- Redo
mapping.map("n", "<ds-z>", "<cmd>redo<cr>", { silent = true })
mapping.map("i", "<ds-z>", "<esc><cmd>redo<cr>", { silent = true })

-- Undo
mapping.map("n", "<d-z>", "<cmd>undo<cr>", { silent = true })
mapping.map("i", "<d-z>", "<esc><cmd>undo<cr>", { silent = true })

-- Save
mapping.map("n", "<D-s>", "<cmd>w<cr>", { silent = true })

-- Close Buffer
mapping.map("n", "<D-w>", "<cmd>bd<cr>", { silent = true })
