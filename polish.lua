return function()
  -- Custom stuff from neovide
  if vim.api.nvim_eval('exists("g:neovide")') then
    require("user.custom.neovide")
  end

  -- ESLint Save on Fix
  require('user.custom.eslint')

  -- Setting env variable
  require('user.custom.zsh')
end
