local config_file_path = vim.fn.expand('$HOME/.pre.zshrc.nvim.local')
local config_file = io.open(config_file_path, 'w')
if (config_file) then
  io.output(config_file)
  io.write('export NVIM_CUSTOM="$HOME/.config/nvim/lua/user"')
  io.close(config_file)
end
