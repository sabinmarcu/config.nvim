return function(opts)
  opts.root_dir = require("lspconfig.util").root_pattern("package.json", ".eslintrc", ".eslintrc.json", ".eslintrc.js",
  ".eslintrc.cjs")
  return opts
end
