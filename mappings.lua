-- local modifierKey
--
-- if (vim.fn.has('macunix')) then
--   modifierKey = "M"
-- else
--   modifierKey = "C"
-- end

local maps = { i = {}, n = {}, v = {}, t = {}, c = {}, o = {}, r = {}, [""] = {} }

maps.n["<M-'>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
maps.t["<M-'>"] = maps.n["<M-'>"]
maps.n["<C-'>"] = maps.n["<M-'>"]
maps.t["<C-'>"] = maps.n["<M-'>"]

maps.n["<M-\\>"] = { "<cmd>Neotree toggle dir=.<cr>", desc = "Toggle Neotree" }
maps.t["<M-\\>"] = maps.n["<M-\\>"]
maps.n["<C-\\>"] = maps.n["<M-\\>"]
maps.t["<C-\\>"] = maps.n["<M-\\>"]

maps.i['<D-v>'] = { '<C-R>+', desc = "Paste from clipboard for insert mode" }
maps.c['<D-v>'] = maps.i['<D-v>']
maps.t['<D-v>'] = maps.i['<D-v>']

maps.n['<D-v>'] = { '"+p<CR>', desc = "Paste from clipboard" }
maps.v['<D-v>'] = maps.n['<D-v>']
maps.o['<D-v>'] = maps.n['<D-v>']

maps.v['<D-c>'] = { '"+y<CR>', desc = "Copy to clipboard" }

maps.i['<D-c>'] = { '', desc = "Copy to clipboard noop for insert mode" }
maps.c['<D-c>'] = maps.i['<D-c>']
maps.n['<D-c>'] = maps.i['<D-c>']
maps.r['<D-c>'] = maps.i['<D-c>']

maps.i['<D-z>'] = { '<C-u>', desc = "Undo" }
maps.n['<D-z>'] = maps.i['<D-z>']
maps.c['<D-z>'] = maps.i['<D-z>']

return maps;
