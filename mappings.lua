local modifierKey

if (vim.fn.has("macunix")) then
  modifierKey = "D"
else
  modifierKey = "C"
end

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

return maps;
