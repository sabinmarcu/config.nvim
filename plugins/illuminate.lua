return function()
  require('illuminate').configure({
    providers = {
      'lsp',
      'treesitter',
      'regex'
    }
  })
end
