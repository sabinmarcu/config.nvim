return function()
  require('neotest').setup({
    adapters = {
      require('neotest-jest'),
    }
  })
end
