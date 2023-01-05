if (vim.fn.has("macunix")) then
  vim.g.modifierKey = "D"
else
  vim.g.modifierKey = "C"
end

local modifierKey = vim.g.modifierKey

local maps = { i = {}, n = {}, v = {}, t = {}, c = {}, o = {}, [""] = {} }

maps.n["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
maps.t["<C-`>"] = maps.n["<C-`>"]

maps.n["<" .. modifierKey .. "-\\>"] = { "<cmd>Neotree toggle dir=.<cr>", desc = "Toggle Neotree" }
maps.t["<" .. modifierKey .. "-\\>"] = maps.n["<" .. modifierKey .. "-\\>"]

maps.i["<" .. modifierKey .. "-v>"] = { "<C-R>+", desc = "Paste from clipboard for insert mode" }
maps.c["<" .. modifierKey .. "-v>"] = maps.i["<" .. modifierKey .. "-v>"]
maps.t["<" .. modifierKey .. "-v>"] = maps.i["<" .. modifierKey .. "-v>"]

maps.n["<" .. modifierKey .. "-v>"] = { '"+p<CR>', desc = "Paste from clipboard" }
maps.v["<" .. modifierKey .. "-v>"] = maps.n["<" .. modifierKey .. "-v>"]
maps.o["<" .. modifierKey .. "-v>"] = maps.n["<" .. modifierKey .. "-v>"]

maps.v["<" .. modifierKey .. "-c>"] = { '"+y<CR>', desc = "Copy to clipboard" }

maps.i["<" .. modifierKey .. "-c>"] = { "", desc = "Copy to clipboard noop for insert mode" }
maps.c["<" .. modifierKey .. "-c>"] = maps.i["<" .. modifierKey .. "-c>"]
maps.n["<" .. modifierKey .. "-c>"] = maps.i["<" .. modifierKey .. "-c>"]

maps.i["<" .. modifierKey .. "-z>"] = { "<Esc>ui", desc = "Undo for insert mode" }
maps.n["<" .. modifierKey .. "-z>"] = { "u", desc = "Undo" }

maps.i["<S-" .. modifierKey .. "-z>"] = { "<Esc><C-r>i", desc = "Redo for insert mode" }
maps.n["<S-" .. modifierKey .. "-z>"] = { "<C-r>", desc = "Redo" }

maps.n["<" .. modifierKey .. "-s>"] = { ":w!<cr>", desc = "Save override" }
maps.i["<" .. modifierKey .. "-s>"] = { "<Esc>:w!<cr>", desc = "Save override for insert mode" }


maps.n["<leader>ja"] = { "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" }
maps.n["<leader>ji"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run File" }
maps.n["<leader>jF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  desc = "Debug File" }
maps.n["<leader>jl"] = { "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last" }
maps.n["<leader>jL"] = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", desc = "Debug Last" }
maps.n["<leader>jn"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "Run Nearest" }
maps.n["<leader>jN"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" }
maps.n["<leader>jo"] = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" }
maps.n["<leader>jS"] = { "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" }
maps.n["<leader>js"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" }

maps.n["<leader>gf"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "File History" } 

return maps;
