return function(opts)
  opts.root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json")
  return opts
end
